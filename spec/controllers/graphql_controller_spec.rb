# frozen_string_literal: true

require 'rails_helper'

describe GraphqlController, type: :controller do
  describe '#execute' do
    let!(:shop) { Seeder.init_shop }
    let(:query_string) do
      %( query {
                               shop(id: #{shop.id}) {
                                 domain
                               }
                             })
    end

    before do
      post :execute, params: { query: query_string }
    end

    it 'renders no errors' do
      expect(json['errors']).to be_blank
    end

    it 'renders a shop json object' do
      expect(json['data']['shop']).to be_present
    end
  end
end
