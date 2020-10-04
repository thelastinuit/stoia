# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :shop, Types::ShopType, null: false do
      argument :id, ID, required: true
    end

    def shop(id:)
      Shop.find(id)
    end

    field :products, [Types::ProductType], null: false
    field :product, Types::ProductType, null: false do
      argument :id, ID, required: true
    end

    def products
      Product.all
    end

    def product(id:)
      Product.find(id)
    end

    field :product_variants, [Types::ProductVariantType], null: false
    field :product_variant, Types::ProductVariantType, null: false do
      argument :id, ID, required: true
    end

    def product_variants
      ProductVariant.all
    end

    def product_variant(id:)
      ProductVariant.find(id)
    end
  end
end
