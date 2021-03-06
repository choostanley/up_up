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

ActiveRecord::Schema.define(version: 20171228051726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "offers",                                array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image"
    t.text     "description"
    t.string   "counter",     default: [],              array: true
    t.integer  "user_id"
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "lives", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_lives_on_item_id", using: :btree
    t.index ["user_id"], name: "index_lives_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "password_digest"
    t.integer  "access_level",    default: 0
    t.string   "avatar"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password"
    t.string   "email",                       null: false
  end

  add_foreign_key "items", "users"
  add_foreign_key "lives", "items"
  add_foreign_key "lives", "users"
end
