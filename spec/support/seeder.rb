module Seeder
  module_function

  def init_merchant
    merchant = FactoryBot.create :merchant
    shop = FactoryBot.create :shop, merchant: merchant
    location = FactoryBot.create :location, shop: shop
    FactoryBot.create_list :product, 10, shop: shop
    shop.product.each do |product|
      product_variants = FactoryBot.create :product_variant, product: product
      product_variants.each do |product_variant|
        FactoryBot.create :inventory, product_variant: product_variant, location: location
      end
    end
  end
end

