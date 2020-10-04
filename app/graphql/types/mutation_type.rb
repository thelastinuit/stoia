# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :calculate_taxes, mutation: Mutations::CalculateTaxesMutation
  end
end
