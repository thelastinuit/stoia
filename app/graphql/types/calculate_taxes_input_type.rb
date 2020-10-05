module Types
  class CalculateTaxesInputType < Types::BaseInputObject
    description "Attributes for the simple tax calculation approach"
    argument :shop_id, Int, required: true
    argument :amounts, [Float], required: true
  end
end
