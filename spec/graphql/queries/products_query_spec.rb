require 'rails_helper'

describe "Products Query", type: :query do
  let(:shop) { Seeder.init_shop }

  before do
    query query_string, context: { current_shop: shop }
  end

  describe "Lists Shop's Products" do
    let(:query_string) { %q(query {
                              products {
                                title
                                shop {
                                  name
                                  domain
                                }
                                productVariantsCount
                              }
                            })
    }

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end 

    it 'should return the products array object' do
      expect(graphql_response.data).to have_key("products")
    end
  end

  describe "Shows Shop's Product" do
    let(:product) { shop.products.sample }
    let(:query_string) { %Q(query {
                              product(id: #{product.id}) {
                                title
                                productVariants {
                                  unitPrice
                                  currencyCode
                                }
                              }
                            })
    }

    it 'should not return errors' do
      expect(graphql_response.errors).to be_blank
    end

    it 'should return the product object' do
      expect(graphql_response.data).to have_key("product")
      expect(graphql_response.data['product']['title']).to eq(product.title)
    end   
  end
end

