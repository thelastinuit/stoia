require 'rails_helper'

describe Shop, type: :model do
  it { belong_to :merchant }
  it { have_many :products }
  it { have_many(:product_variants).through(:products) }
end
