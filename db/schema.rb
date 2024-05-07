# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_07_083523) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "castle_id", null: false
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["castle_id"], name: "index_bookings_on_castle_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "castles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_castles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "castles"
  add_foreign_key "bookings", "users"
  add_foreign_key "castles", "users"
end
