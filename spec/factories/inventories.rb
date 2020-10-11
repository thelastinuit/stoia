# frozen_string_literal: true

FactoryBot.define do
  factory :inventory do
    quantity { rand(1..100) }
    location
    product_variant
  end
end
