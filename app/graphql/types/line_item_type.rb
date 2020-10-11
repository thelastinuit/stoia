# frozen_string_literal: true

module Types
  class LineItemType < Types::BaseObject
    field :id, ID, null: false
    field :unit_price, Float, null: false
    field :quantity, Int, null: false
    field :order, Types::OrderType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
