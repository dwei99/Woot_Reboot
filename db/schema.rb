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

ActiveRecord::Schema.define(version: 20170130184530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "nuumber"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["item_id"], name: "index_categories_on_item_id", using: :btree

  create_table "discussions", force: :cascade do |t|
    t.string   "content"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "discussions", ["item_id"], name: "index_discussions_on_item_id", using: :btree
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "img_url"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "categories", "items"
  add_foreign_key "discussions", "items"
  add_foreign_key "discussions", "users"
  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "users"
  add_foreign_key "reviews", "items"
end
