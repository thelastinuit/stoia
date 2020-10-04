require 'rails_helper'

describe Types::LocationType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:city).of_type("String") }
  it { should have_field(:country).of_type("String") }
  it { should have_field(:address).of_type("String") }
  it { should have_field(:telephone).of_type("String") }
  it { should have_field(:shop).of_type("Shop!") }
  it { should have_field(:created_at).of_type("ISO8601DateTime!") }
  it { should have_field(:updated_at).of_type("ISO8601DateTime!") }
  it { should have_field(:inventories).of_type("[Inventory!]") }
end
