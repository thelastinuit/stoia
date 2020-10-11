# frozen_string_literal: true

# Represent Product's Inventory
# Each product variant has a respective quantity based on location. Inventory represents the available quantity per location.
class Inventory < ApplicationRecord
  belongs_to :location
  belongs_to :product_variant
end
