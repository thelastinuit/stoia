# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :address
      t.string :telephone
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
