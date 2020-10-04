FactoryBot.define do
  factory :product do
    title { FFaker::Product.brand }
    shop
  end
end
