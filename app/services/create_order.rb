# frozen_string_literal: true

module CreateOrder
  module_function

  def call(shop: nil, product_variants: nil)
    order = Order.create! shop: shop
    # Iterate over product_variants (id, quantity)
    product_variants.each do |product_variant_attributes|
      product_variant = ProductVariant.find product_variant_attributes[:id]
      LineItem.create! unit_price: product_variant.unit_price,
                       quantity: product_variant_attributes[:quantity],
                       product_variant_id: product_variant.id,
                       order_id: order.id
    end
    order
  end
end
