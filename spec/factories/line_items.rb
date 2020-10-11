# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    order
    unit_price { 0 }
    quantity { 0 }
    product_variant_id { 0 }
  end
end
