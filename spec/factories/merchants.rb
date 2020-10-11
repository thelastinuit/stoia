# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    name { FFaker::Name.name }
  end
end
