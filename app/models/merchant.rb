# frozen_string_literal: true

# Represent a Merchant
# A merchant can have multiple shops which can be in the same country
class Merchant < ApplicationRecord
  has_many :shops, dependent: :destroy
end
