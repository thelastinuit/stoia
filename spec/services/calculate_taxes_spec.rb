# frozen_string_literal: true

require 'rails_helper'

describe CalculateTaxes, type: :service do
  describe '#call' do
    let(:order) { Seeder.init_order }

    it 'update order with taxes' do
      expect do
        CalculateTaxes.call order: order
      end.to change { order.tax }
    end
  end
end
