# frozen_string_literal: true

require 'rails_helper'

describe LineItem, type: :model do
  it { should belong_to :order }
end
