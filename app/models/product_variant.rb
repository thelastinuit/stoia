# Represents a Product Variant
# Product Variants is a product variant of a product. Product Variant may have inventory in diff locations
class ProductVariant < ApplicationRecord
  has_many :inventories
  belongs_to :product
end
