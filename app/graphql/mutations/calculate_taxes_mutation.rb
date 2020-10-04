module Mutations
  class CalculateTaxesMutation < Mutations::BaseMutation
    argument :amounts, [Float], required: true

    field :taxed_amount, Float, null: false

    def resolve(amounts:)
      taxed_amount = 0
      {
        taxed_amount: taxed_amount
      }
    end
  end
end

