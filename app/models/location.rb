# frozen_string_literal: true

# Represents a Location
# A shop can have multiple locations depending on place the shop sells products.
# Each location has its own inventory.
class Location < ApplicationRecord
  has_many :inventories
  belongs_to :shop
end
