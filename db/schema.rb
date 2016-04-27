# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160414044655) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name", limit: 100
    t.string   "last_name",  limit: 100
    t.integer  "pincode"
    t.text     "landmark"
    t.text     "address"
    t.string   "mobile",     limit: 15
    t.integer  "status",     limit: 1,   default: 1
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "addresses", ["city"], name: "index_addresses_on_city"
  add_index "addresses", ["country"], name: "index_addresses_on_country"
  add_index "addresses", ["first_name"], name: "index_addresses_on_first_name"
  add_index "addresses", ["last_name"], name: "index_addresses_on_last_name"
  add_index "addresses", ["pincode"], name: "index_addresses_on_pincode"
  add_index "addresses", ["state"], name: "index_addresses_on_state"
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.integer  "parent_id"
    t.string   "url_string"
    t.string   "seo_title"
    t.string   "seo_meta"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.text     "valid_product"
    t.text     "valid_category"
    t.text     "valid_company"
    t.text     "valid_city"
    t.integer  "value"
    t.integer  "value_type"
    t.integer  "qualifying_amount"
    t.integer  "max_discount"
    t.integer  "max_usage"
    t.integer  "max_usage_per_user"
    t.datetime "expire_date"
    t.datetime "start_date"
    t.string   "success_message"
    t.string   "coupon_message"
    t.integer  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "alt_tag"
    t.text     "details"
    t.integer  "priority",           limit: 1
    t.integer  "sub_type",           limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "invoices", force: :cascade do |t|
    t.integer  "order_id"
    t.text     "invoice_note"
    t.integer  "admin_user_id"
    t.datetime "invoice_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "invoices", ["invoice_date"], name: "index_invoices_on_invoice_date"
  add_index "invoices", ["order_id"], name: "index_invoices_on_order_id"

  create_table "order_processes", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "barcode",        limit: 50
    t.integer  "courier_id"
    t.text     "rto_reason"
    t.datetime "packing_date"
    t.datetime "shipping_date"
    t.datetime "delivered_date"
    t.datetime "rto_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "order_processes", ["barcode"], name: "index_order_processes_on_barcode"
  add_index "order_processes", ["courier_id"], name: "index_order_processes_on_courier_id"
  add_index "order_processes", ["order_id"], name: "index_order_processes_on_order_id"
  add_index "order_processes", ["packing_date"], name: "index_order_processes_on_packing_date"
  add_index "order_processes", ["rto_date"], name: "index_order_processes_on_rto_date"
  add_index "order_processes", ["shipping_date"], name: "index_order_processes_on_shipping_date"

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_size_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id"
  add_index "order_products", ["product_size_id"], name: "index_order_products_on_product_size_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.integer  "cod_money"
    t.integer  "shipping_money"
    t.integer  "status",          default: 0
    t.integer  "is_confirm",      default: 0
    t.integer  "payment_gateway"
    t.integer  "admin_user_id"
    t.integer  "invoice_id"
    t.text     "note"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "orders", ["is_confirm"], name: "index_orders_on_is_confirm"
  add_index "orders", ["status"], name: "index_orders_on_status"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id"
  add_index "product_categories", ["product_id", "category_id"], name: "index_product_categories_on_product_id_and_category_id", unique: true
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id"

  create_table "product_sizes", force: :cascade do |t|
    t.integer  "product_id",                       null: false
    t.string   "size",                             null: false
    t.integer  "qty_avail",            default: 0
    t.integer  "size_unit",  limit: 1, default: 0
    t.integer  "status",     limit: 1, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "weight"
    t.integer  "mrp"
    t.integer  "price"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url",              limit: 100
    t.string   "meta_title"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.integer  "company_id"
    t.integer  "rank",             limit: 2
    t.integer  "status",           limit: 1,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "products", ["status"], name: "index_products_on_status"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
