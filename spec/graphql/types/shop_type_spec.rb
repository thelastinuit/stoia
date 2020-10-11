# frozen_string_literal: true

require 'rails_helper'

describe Types::ShopType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:name).of_type('String') }
  it { should have_field(:domain).of_type('String') }
  it { should have_field(:created_at).of_type('ISO8601DateTime!') }
  it { should have_field(:updated_at).of_type('ISO8601DateTime!') }
end
