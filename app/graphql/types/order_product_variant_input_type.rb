# frozen_string_literal: true

module Types
  class OrderProductVariantInputType < Types::BaseInputObject
    description 'Attributes for an order creation based on product variants'
    argument :id, Int, required: true
    argument :quantity, Int, required: true
  end
end
