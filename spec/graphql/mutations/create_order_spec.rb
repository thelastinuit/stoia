# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateOrder, type: :mutation do
  let(:shop) { Seeder.init_shop }
  let(:product_variants) { shop.product_variants.map { |pv| { id: pv.id, quantity: 1 }} }

  before do
    query mutation_string,
          variables: {
            shopId: shop.id,
            productVariants: product_variants
          },
          context: { current_shop: shop }
  end

  describe 'Creates Order' do
    let(:mutation_string) do
      %(mutation createOrder($shopId: Int, $productVariants: [OrderProductVariantInput!]) {
                              createOrder(input: {
                                shopId: $shopId
                                productVariants: $productVariants
                              }) {
                                order {
                                  subtotal
                                  tax
                                  total
                                }
                              }
                            })
    end

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end

    it 'should return the order object' do
      expect(graphql_response.data['createOrder']).to have_key('order')
    end
  end
end
