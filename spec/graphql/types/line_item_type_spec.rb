# frozen_string_literal: true

require 'rails_helper'

describe Types::LineItemType do
  subject { described_class }
  it { should have_field(:id).of_type(!types.ID) }
  it { should have_field(:unit_price).of_type('Float!') }
  it { should have_field(:quantity).of_type('Int!') }
  it { should have_field(:order).of_type('Order!') }
  it { should have_field(:created_at).of_type('ISO8601DateTime!') }
  it { should have_field(:updated_at).of_type('ISO8601DateTime!') }
end
