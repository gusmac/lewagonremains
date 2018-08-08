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

ActiveRecord::Schema.define(version: 2018_08_08_104804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "storage_space_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "price_cents_cents", default: 0, null: false
    t.string "price_cents_currency", default: "EUR", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_space_id"], name: "index_bookings_on_storage_space_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.bigint "storage_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_space_id"], name: "index_reviews_on_storage_space_id"
  end

  create_table "storage_spaces", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.integer "price_cents_cents", default: 0, null: false
    t.string "price_cents_currency", default: "EUR", null: false
    t.string "photo"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_storage_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "storage_spaces"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "storage_spaces"
  add_foreign_key "storage_spaces", "users"
end
