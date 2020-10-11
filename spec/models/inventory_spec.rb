# frozen_string_literal: true

require 'rails_helper'

describe Inventory, type: :model do
  it { should belong_to :product_variant }
  it { should belong_to :location }
end
