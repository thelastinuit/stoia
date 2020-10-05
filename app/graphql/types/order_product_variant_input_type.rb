module Types
  class OrderProductVariantInputType < Types::BaseInputObject
    argument :id, Int, required: true
    argument :quantity, Int, required: true
  end
end
