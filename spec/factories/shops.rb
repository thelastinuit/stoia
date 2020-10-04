FactoryBot.define do
  factory :shop do
    name { FFaker::Product.name } 
    domain { "#{FFaker::Internet.domain_word}.stoia.shop" }
    merchant
  end
end
