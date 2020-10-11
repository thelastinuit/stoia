# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :calculate_taxes, mutation: Mutations::CalculateTaxes
    field :create_order, mutation: Mutations::CreateOrder
  end
end
