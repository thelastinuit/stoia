require 'rails_helper'

describe Order, type: :model do
  it { should belong_to :shop }
  it { should have_many :line_items }
end
