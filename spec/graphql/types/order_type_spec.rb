# frozen_string_literal: true

require 'rails_helper'

describe Types::OrderType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:tax).of_type('Float!') }
  it { should have_field(:subtotal).of_type('Float!') }
  it { should have_field(:total).of_type('Float!') }
  it { should have_field(:shop).of_type('Shop!') }
  it { should have_field(:created_at).of_type('ISO8601DateTime!') }
  it { should have_field(:updated_at).of_type('ISO8601DateTime!') }
end
