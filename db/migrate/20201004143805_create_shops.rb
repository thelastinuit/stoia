class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :domain
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
