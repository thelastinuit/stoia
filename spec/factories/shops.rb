# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { FFaker::Product.name }
    domain { "#{FFaker::Internet.domain_word}.stoia.shop" }
    merchant
    tax { rand(1..16) }
  end
end
