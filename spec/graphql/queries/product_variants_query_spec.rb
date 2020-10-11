# frozen_string_literal: true

require 'rails_helper'

describe 'Product Variants Query', type: :query do
  let(:shop) { Seeder.init_shop }

  before do
    query query_string, context: { current_shop: shop }
  end

  describe "Lists Shop's Product Variants" do
    let(:query_string) do
      'query {
                              productVariants {
                                unitPrice
                                currencyCode
                                inventories {
                                  quantity
                                }
                              }
                            }'
    end

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end

    it 'should return the product variants array object' do
      expect(graphql_response.data).to have_key('productVariants')
    end
  end

  describe "Shows Shop's Product Variant" do
    let(:product_variant) { shop.product_variants.sample }
    let(:query_string) do
      %(query {
                              productVariant(id: #{product_variant.id}) {
                                  unitPrice
                              }
                            })
    end

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end

    it 'should return the product variant object' do
      expect(graphql_response.data).to have_key('productVariant')
      expect(graphql_response.data['productVariant']['unitPrice']).to eq(product_variant.unit_price)
    end
  end
end
