# frozen_string_literal: true

require 'rails_helper'

describe Product, type: :model do
  it { should belong_to :shop }
  it { should have_many :product_variants }
end
