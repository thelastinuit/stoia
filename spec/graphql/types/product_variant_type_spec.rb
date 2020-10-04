require 'rails_helper'

describe Types::ProductVariantType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:sku).of_type("String") }
  it { should have_field(:unit_price).of_type("Float") }
  it { should have_field(:currency_code).of_type("String") }
  it { should have_field(:product_id).of_type("Int!") }
  it { should have_field(:created_at).of_type("ISO8601DateTime!") }
  it { should have_field(:updated_at).of_type("ISO8601DateTime!") }
  it { should have_field(:inventories).of_type("[Inventory!]") }
end
