module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :shop, Types::ShopType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :product_variants, [Types::ProductVariantType], null: true
    field :product_variants_count, Integer, null: true

    def product_variants_count
      object.product_variants.count
    end
  end
end
