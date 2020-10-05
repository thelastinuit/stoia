module Mutations
  class CalculateTaxes < Mutations::BaseMutation
    argument :shop_id, Int, required: true
    argument :amounts, [Float], required: true

    field :taxed_amount, Float, null: false

    def resolve(amounts:, shop_id:)
      shop = Shop.find shop_id
      total_amount = amounts.sum
      taxed_amount = total_amount * ( shop.tax / 100.0 + 1)
      {
        taxed_amount: total_amount
      }
    end
  end
end

