# frozen_string_literal: true

module CalculateTaxes
  module_function

  def call(order: nil)
    raise StoiaExceptions::MissingOrder unless order.present?

    tax_percentage = order.shop.tax
    subtotal = order.line_items.inject(0) { |acc, li| acc + li.unit_price * li.quantity }
    total = (tax_percentage / 100.0 + 1) * subtotal
    order.update! subtotal: subtotal, total: total, tax: tax_percentage
  end
end
