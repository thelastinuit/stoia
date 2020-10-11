# frozen_string_literal: true

require 'rails_helper'

describe Types::ProductType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:title).of_type('String') }
  it { should have_field(:shop).of_type('Shop!') }
  it { should have_field(:created_at).of_type('ISO8601DateTime!') }
  it { should have_field(:updated_at).of_type('ISO8601DateTime!') }
  it { should have_field(:product_variants).of_type('[ProductVariant!]') }
  it { should have_field(:product_variants_count).of_type('Int') }
end
