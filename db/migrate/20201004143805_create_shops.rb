# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :domain
      t.decimal :tax, precision: 10, scale: 2
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
