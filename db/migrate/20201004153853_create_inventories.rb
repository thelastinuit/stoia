class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.references :location, null: false, foreign_key: true
      t.references :product_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
