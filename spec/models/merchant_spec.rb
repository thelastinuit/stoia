# frozen_string_literal: true

require 'rails_helper'

describe Merchant, type: :model do
  it { should have_many :shops }
end
