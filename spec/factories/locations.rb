# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    address { FFaker::Address.street_address }
    telephone { FFaker::PhoneNumber.phone_number }
    shop
  end
end
