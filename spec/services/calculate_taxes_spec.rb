require 'rails_helper'

describe CalculateTaxes, type: :service do
  describe "#call" do
    let(:order) { Seeder.init_order }

    it "update order with taxes" do
      expect {
        CalculateTaxes.call order: order
      }.to change { order.tax }
    end
  end
end

