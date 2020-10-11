# stoia
Demo GraphQL API

## Table of contents

* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Running specs](#running-specs)

## Development

### Setup the project

1. Clone this repository into your local machine

```bash
$ git clone git@github.com:thelastinuit/stoia.git
```

2. Run the web service in bash mode to get inside the container by using
   the following command:

```bash
$ docker-compose run web bash
```

3. Inside the container you can to migrate the database:

```
% bundle exec rails db:migrate
```

### Running the stack for Development

1. Fire up a terminal and run:

```bash
$ docker-compose up
```

That command will lift every service stoia needs, such as the `bundle exec rails server`, and `postgres`.

It may take a while before you see anything, you can follow the logs of the containers with:

```
$ docker-compose logs
```

Once you see an output like this:

```
web_1   | => Booting Puma
web_1   | => Rails 5.1.3 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | Listening on 0.0.0.0:3000, CTRL+C to stop
```

This means the project is up and running.

### Stop the project

In order to stop stoia as a whole you can run:

```
$ docker-compose stop
```

This will stop every container, but if you need to stop one in particular, you can specify it like:

```
$ docker-compose stop web
```

`web` is the service name located on the `docker-compose.yml` file, there you can see the services name and stop each of them if you need to.

### Running specs

To run specs, you can do:

```
$ docker-compose run test bundle exec rspec
```

Or for a specific file:

```
$ docker-compose run test bundle exec rspec spec/models/inventory_spec.rb
```
