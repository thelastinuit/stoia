require 'rails_helper'

describe Types::InventoryType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:quantity).of_type("Int") }
  it { should have_field(:location).of_type("Location!") }
  it { should have_field(:product_variant).of_type("ProductVariant!") }
  it { should have_field(:created_at).of_type("ISO8601DateTime!") }
  it { should have_field(:updated_at).of_type("ISO8601DateTime!") }
end
