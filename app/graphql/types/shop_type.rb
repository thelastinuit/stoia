module Types
  class ShopType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :domain, String, null: true
    field :merchant, Types::MerchantType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
