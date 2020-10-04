module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: false
    field :quantity, Integer, null: true
    field :location, Types::LocationType, null: false
    field :product_variant, Types::ProductVariantType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
