# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 2
      t.integer :quantity
      t.integer :product_variant_id

      t.timestamps
    end
  end
end
