# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'graphql'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-graphql_matchers'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false, group: :test
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
