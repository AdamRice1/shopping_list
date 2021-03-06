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

ActiveRecord::Schema.define(version: 20191023195438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "item"
    t.integer  "quantity"
    t.integer  "account_owner_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_owner_id"], name: "index_lists_on_account_owner_id", using: :btree
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_level"
    t.integer  "account_owner_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_owner_id"], name: "index_users_on_account_owner_id", using: :btree
  end

  add_foreign_key "lists", "account_owners"
  add_foreign_key "lists", "users"
  add_foreign_key "users", "account_owners"
end
