# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
