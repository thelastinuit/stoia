# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CalculateTaxes, type: :mutation do
  let(:shop) { Seeder.init_shop }

  before do
    query mutation_string,
          variables: {
            shop_id: shop.id,
            amounts: [3.14, 6.28]
          },
          context: { current_shop: shop }
  end

  describe 'Get taxed amounts' do
    let(:mutation_string) do
      'mutation calculateTaxes($shopId: Int, $amounts: [Float]) {
                                 calculateTaxes(input: {
                                   shopId: $shopId
                                   amounts: $amounts
                                 }) {
                                   taxedAmount
                                 }
                              }'
    end

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end

    it 'should return the order object' do
      expect(graphql_response.data['calculateTaxes']).to have_key('taxedAmount')
    end
  end
end
