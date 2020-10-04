module Types
  class ProductVariantType < Types::BaseObject
    field :id, ID, null: false
    field :sku, String, null: true
    field :unit_price, Float, null: true
    field :currency_code, String, null: true
    field :product_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :inventories, [Types::InventoryType], null: true
  end
end
