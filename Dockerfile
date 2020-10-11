# I: Runtime Stage: ============================================================
# This is the stage where we build the runtime base image, which is used as the
# common ancestor by the rest of the stages, and contains the minimal runtime
# dependencies required for the application to run:

# Step 1: Use the official Ruby 2.6.3 Slim Strech image as base:
FROM ruby:2.6.3-slim-stretch AS runtime

# Step 2: We'll set the MALLOC_ARENA_MAX for optimization purposes & prevent memory bloat
# https://www.speedshop.co/2017/12/04/malloc-doubles-ruby-memory.html
ENV MALLOC_ARENA_MAX="2"

# Step 3: We'll set the LANG encoding to be UTF-8 for special characters support
ENV LANG C.UTF-8

# Step 4: We'll set '/usr/src' path as the working directory:
# NOTE: This is a Linux "standard" practice - see:
# - http://www.pathname.com/fhs/2.2/
# - http://www.pathname.com/fhs/2.2/fhs-4.1.html
# - http://www.pathname.com/fhs/2.2/fhs-4.12.html
WORKDIR /usr/src

# Step 5: We'll set the working dir as HOME and add the app's binaries path to
# $PATH:
ENV HOME=/usr/src PATH=/usr/src/bin:$PATH

# Step 6: We'll install curl for later dependencies installations
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl

# Step 7: Install the common runtime dependencies:
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https software-properties-common \
    ca-certificates \
    libpq5 \
    openssl \
    tzdata && \
    rm -rf /var/lib/apt/lists/*

# Step 8: Add Dockerize image
RUN export DOCKERIZE_VERSION=v0.6.1 && curl -L \
    https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    | tar -C /usr/local/bin -xz

# II: Development Stage: =======================================================
# In this stage we'll build the image used for development, including compilers,
# and development libraries. This is also a first step for building a releasable
# Docker image:

# Step 10: Start off from the "runtime" stage:
FROM runtime AS development

# Step 11: Install the development dependency packages with alpine package
# manager:
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Step 12: Copy the project's Gemfile + lock:
COPY Gemfile* /usr/src/

# Step 13: Install the current project gems - they can be safely changed later
# during development via `bundle install` or `bundle update`:
RUN bundle install --jobs=4 --retry=3

# Step 14: Set the default command:
CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0" ]

# III: Testing stage: ==========================================================
# In this stage we'll add the current code from the project's source, so we can
# run tests with the code.
# Step 15: Start off from the development stage image:
FROM development AS testing

# Step 16: Copy the rest of the application code
COPY . /usr/src

# Step 17: Receive the developer user's UID:
ARG DEVELOPER_UID=1000

# Step 18: Receive the developer user's username:
ARG DEVELOPER_USERNAME=you

# Step 19: Set the developer's UID as an environment variable:
ENV DEVELOPER_UID=${DEVELOPER_UID}

# Step 20: Create the developer user:
RUN useradd -r -M -u ${DEVELOPER_UID} -d /usr/src -c "Developer User,,," ${DEVELOPER_USERNAME} \
 && echo ${DEVELOPER_USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${DEVELOPER_USERNAME} \
 && chmod 0440 /etc/sudoers.d/${DEVELOPER_USERNAME}

# IV: Builder stage: ===========================================================
# In this stage we'll do some tests and cleanup. 
# If the CI/CD that builds this image allows it, we should
# also run the app test suites here:

# Step 21: Start off from the development stage image:
FROM testing AS builder

# Step 22: Precompile assets:
RUN export DATABASE_URL=postgres://postgres@example.com:5432/fakedb \
    SECRET_KEY_BASE=10167c7f7654ed02b3557b05b88ece \
    RAILS_ENV=production && \
    bundle exec rails secret > /dev/null

# Step 23: Remove installed gems that belong to the development & test groups -
# we'll copy the remaining system gems into the deployable image on the next
# stage:
RUN bundle config without development:test && bundle clean --force

# Step 24: Remove files not used on release image:
RUN rm -rf \
    .rspec \
    Guardfile \
    bin/rspec \
    bin/checkdb \
    bin/setup \
    bin/spring \
    bin/update \
    bin/dev-entrypoint.sh \
    config/spring.rb \
    spec \
    tmp/*

# V: Release stage: ============================================================
# In this stage, we build the final, deployable Docker image, which will be
# smaller than the images generated on previous stages:

# Step 25: Start off from the runtime stage image:
FROM runtime AS release

# Step 26: Copy the remaining installed gems from the "builder" stage:
COPY --from=builder /usr/local/bundle /usr/local/bundle

# Step 27: Copy the app code from the "builder" stage, which at this point
# should have the assets from the asset pipeline already compiled:
COPY --from=builder --chown=nobody:nogroup /usr/src /usr/src

# Step 28: Set the RAILS/RACK_ENV and PORT default values:
ENV RAILS_ENV=production RACK_ENV=production PORT=3000

# Step 29: Generate the temporary directories in case they don't already exist:
RUN mkdir -p /usr/src/tmp/cache /usr/src/tmp/pids /usr/src/tmp/sockets \
 && chown -R nobody:nogroup /usr/src/tmp

# Step 30: Set the container user to 'nobody':
USER nobody

# Step 31: Set the default command:
CMD [ "puma" ]

# Step 32 thru 35: Add label-schema.org labels to identify the build info:
ARG SOURCE_BRANCH="master"
ARG SOURCE_COMMIT="000000"
ARG BUILD_DATE="2020-10-11T12:53:26Z"
ARG IMAGE_NAME="stoia:latest"

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Stoia" \
      org.label-schema.description="stoia" \
      org.label-schema.vcs-url="https://github.com/thelastinuit/stoia.git" \
      org.label-schema.vcs-ref=$SOURCE_COMMIT \
      org.label-schema.schema-version="1.0.0-rc1" \
      build-target="release" \
      build-branch=$SOURCE_BRANCH
