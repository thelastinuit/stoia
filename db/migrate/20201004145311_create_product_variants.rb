class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.string :sku
      t.decimal :unit_price
      t.string :currency_code
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
