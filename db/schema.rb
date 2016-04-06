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

ActiveRecord::Schema.define(version: 20160405065644) do

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
