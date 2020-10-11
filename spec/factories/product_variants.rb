# frozen_string_literal: true

FactoryBot.define do
  factory :product_variant do
    sku { SecureRandom.uuid }
    unit_price { rand(1.99..499.99) }
    currency_code { FFaker::Currency.code }
    product
  end
end
