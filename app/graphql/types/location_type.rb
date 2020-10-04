module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :city, String, null: true
    field :country, String, null: true
    field :address, String, null: true
    field :telephone, String, null: true
    field :shop, Types::ShopType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :inventories, [Types::InventoryType], null: true
  end
end
