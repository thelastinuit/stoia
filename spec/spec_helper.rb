# frozen_string_literal: true

require 'simplecov'
ENV['RAILS_ENV'] ||= 'test'

SimpleCov.start 'rails' do
  %w[base_argument.rb base_enum.rb base_field.rb base_input_object.rb base_interface.rb base_object.rb base_scalar.rb base_union.rb].each do |filename|
    add_filter "/app/graphql/types/#{filename}" 
  end
  add_filter "/app/graphql/mutations/base_mutation.rb"
  add_filter "/app/controllers/graphql_controller.rb"
  add_filter "/app/controllers/concerns/rescue_error.rb"
  add_filter "/app/lib/stoia_exceptions.rb"
end

require 'rspec/graphql_matchers'
include RSpec::GraphqlMatchers::TypesHelper

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
