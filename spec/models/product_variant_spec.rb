require 'rails_helper'

describe ProductVariant, type: :model do
  it { should belong_to :product }
  it { should have_many :inventories }
end
