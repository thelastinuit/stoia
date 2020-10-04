require 'rails_helper'

describe Types::MerchantType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:name).of_type("String") }
  it { should have_field(:created_at).of_type("ISO8601DateTime!") }
  it { should have_field(:updated_at).of_type("ISO8601DateTime!") }
  it { should have_field(:shops).of_type("[Shop!]") }
  it { should have_field(:shops_count).of_type("Int") }
end
