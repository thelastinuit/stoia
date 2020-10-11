# frozen_string_literal: true

module Types
  class MerchantType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :shops, [Types::ShopType], null: true
    field :shops_count, Integer, null: true
  end
end
