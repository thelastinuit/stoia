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
end

