# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_05_011850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "location_id", null: false
    t.bigint "product_variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_inventories_on_location_id"
    t.index ["product_variant_id"], name: "index_inventories_on_product_variant_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.decimal "unit_price", precision: 10, scale: 2
    t.integer "quantity"
    t.integer "product_variant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "address"
    t.string "telephone"
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_locations_on_shop_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.decimal "subtotal", precision: 10, scale: 2, default: "0.0"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.decimal "tax", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_orders_on_shop_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "sku", null: false
    t.decimal "unit_price", precision: 10, scale: 2
    t.string "currency_code"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.decimal "tax", precision: 10, scale: 2
    t.bigint "merchant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id"], name: "index_shops_on_merchant_id"
  end

  add_foreign_key "inventories", "locations"
  add_foreign_key "inventories", "product_variants"
  add_foreign_key "line_items", "orders"
  add_foreign_key "locations", "shops"
  add_foreign_key "orders", "shops"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "shops"
  add_foreign_key "shops", "merchants"
end
