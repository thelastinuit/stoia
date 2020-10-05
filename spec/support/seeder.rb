module Seeder
  module_function

  def init_shop
    merchant = FactoryBot.create :merchant
    shop = FactoryBot.create :shop, merchant: merchant
    location = FactoryBot.create :location, shop: shop
    FactoryBot.create_list :product, 10, shop: shop
    shop.products.each do |product|
      product_variants = FactoryBot.create_list :product_variant, 10, product: product
      product_variants.each do |product_variant|
        FactoryBot.create :inventory, product_variant: product_variant, location: location
      end
    end
    shop
  end

  def init_order(shop: nil)
    shop = shop || Seeder.init_shop
    order = FactoryBot.create :order, shop: shop
    product_variants = shop.product_variants.limit(3)
    product_variants.each do |product_variant|
      FactoryBot.create :line_item, unit_price: product_variant.unit_price, quantity: 1, product_variant_id: product_variant.id
    end
    order
  end
end

