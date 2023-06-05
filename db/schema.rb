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

ActiveRecord::Schema.define(version: 2022_02_21_085731) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.text "body"
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_interactions_on_recipient_id"
    t.index ["room_id"], name: "index_interactions_on_room_id"
    t.index ["sender_id"], name: "index_interactions_on_sender_id"
  end

  create_table "lines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_lines_on_location_id"
    t.index ["user_id"], name: "index_lines_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "room_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_photos_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "host_id", null: false
    t.integer "number_of_bedrooms"
    t.string "name"
    t.text "description"
    t.float "cost_per_night"
    t.string "number_of_bathrooms"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "address_latitude"
    t.float "address_longitude"
    t.string "address_formatted_address"
    t.index ["host_id"], name: "index_rooms_on_host_id"
  end

  create_table "user_rooms", force: :cascade do |t|
    t.integer "guest_id", null: false
    t.integer "room_id", null: false
    t.date "check_in"
    t.date "check_out"
    t.boolean "approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_id"], name: "index_user_rooms_on_guest_id"
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interactions", "rooms"
  add_foreign_key "interactions", "users", column: "recipient_id"
  add_foreign_key "interactions", "users", column: "sender_id"
  add_foreign_key "lines", "rooms", column: "location_id"
  add_foreign_key "lines", "users"
  add_foreign_key "photos", "rooms"
  add_foreign_key "rooms", "users", column: "host_id"
  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users", column: "guest_id"
end
