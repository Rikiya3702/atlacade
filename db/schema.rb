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

ActiveRecord::Schema.define(version: 20191125025118) do

  create_table "events", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.date "event_date", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_events_on_shop_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "title", null: false
    t.string "maker"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "official_url"
    t.text "machine_info"
  end

  create_table "shop_machines", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "machine_id", null: false
    t.string "price", default: "100円"
    t.integer "own", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_shop_machines_on_machine_id"
    t.index ["shop_id", "machine_id"], name: "index_shop_machines_on_shop_id_and_machine_id", unique: true
    t.index ["shop_id"], name: "index_shop_machines_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "shop_name", null: false
    t.string "tel", null: false
    t.string "adress"
    t.string "access"
    t.string "business_hours"
    t.string "nearest_station"
    t.text "shop_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "official_url"
    t.float "latitude"
    t.float "longitude"
    t.index ["tel"], name: "index_shops_on_tel", unique: true
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.boolean "emoney", default: false
    t.boolean "paseli", default: false
    t.boolean "parking", default: false
    t.boolean "open24h", default: false
    t.boolean "older18", default: false
    t.integer "smoking", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hand_towel"
    t.boolean "locker"
    t.boolean "wifi"
    t.index ["shop_id"], name: "index_tags_on_shop_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.integer "role", default: 0, null: false
    t.string "image"
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
