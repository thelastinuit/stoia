module Mutations
  class CreateOrder < Mutations::BaseMutation
    argument :shop_id, Int, required: true
    argument :product_variants, [Types::OrderProductVariantInputType], required: true

    field :order, Types::OrderType, null: false

    def resolve(shop_id:, product_variants:)
      shop = Shop.find shop_id
      order = ::CreateOrder.call shop: shop, product_variants: product_variants
      ::CalculateTaxes.call order: order
      {
        order: order.reload
      }
    end
  end
end

