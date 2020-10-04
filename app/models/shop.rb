# Represents a Shop
# Shops can be from the same country however through the Location model, inventory can be *located* in diff countries.
class Shop < ApplicationRecord
  has_many :products
  has_many :product_variants, through: :products
  belongs_to :merchant
end
