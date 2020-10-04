# Represents a Product
# Products can have multiple variants. Variants are the item that are actually sold based on inventory.
class Product < ApplicationRecord
  belongs_to :shop
  has_many :product_variants
end
