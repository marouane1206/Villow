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

ActiveRecord::Schema[7.0].define(version: 2023_11_22_161402) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "favoriter_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoriter_id"], name: "index_favorites_on_favoriter_id"
    t.index ["listing_id"], name: "index_favorites_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "price", null: false
    t.integer "bedroom", null: false
    t.integer "bathroom", null: false
    t.integer "sqmt", null: false
    t.string "address", null: false
    t.string "listing_type", null: false
    t.string "est_payment", null: false
    t.string "building_type", null: false
    t.integer "built_in", null: false
    t.boolean "heating"
    t.boolean "ac"
    t.boolean "garage"
    t.float "price_sqmt", null: false
    t.text "overview", null: false
    t.text "key_words", null: false
    t.integer "views", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode", null: false
    t.bigint "owner_id"
    t.string "city", default: "NY", null: false
    t.string "state", default: "NY", null: false
    t.float "lat"
    t.float "lng"
    t.index ["owner_id"], name: "index_listings_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "listings"
  add_foreign_key "favorites", "users", column: "favoriter_id"
  add_foreign_key "listings", "users", column: "owner_id"
end
