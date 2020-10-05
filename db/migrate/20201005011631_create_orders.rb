class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :shop, null: false, foreign_key: true
      t.decimal :subtotal, default: 0.0, precision: 10, scale: 2
      t.decimal :total, default: 0.0, precision: 10, scale: 2
      t.decimal :tax, default: 0.0, precision: 10, scale: 2

      t.timestamps
    end
  end
end
