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

ActiveRecord::Schema.define(version: 2021_05_17_040212) do

  create_table "action_text_rich_texts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "pitches_id", null: false
    t.bigint "owners_id", null: false
    t.string "book_day"
    t.string "time_booking"
    t.string "start_time_book"
    t.string "end_time_book"
    t.integer "verified"
    t.string "ticket"
    t.integer "total_price"
    t.index ["owners_id"], name: "index_bookings_on_owners_id"
    t.index ["pitches_id"], name: "index_bookings_on_pitches_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "chucvus", charset: "utf8mb4", force: :cascade do |t|
    t.string "tenChucVu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ckeditor_assets", charset: "utf8mb4", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "doibongs", charset: "utf8mb4", force: :cascade do |t|
    t.string "tenDoiBong"
    t.string "tenVietTat"
    t.string "date"
    t.string "khauHieu"
    t.integer "id_user"
    t.string "trandau"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "string"
  end

  create_table "loaitins", charset: "utf8mb4", force: :cascade do |t|
    t.string "tenLoaiTin"
    t.bigint "theloais_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theloais_id"], name: "index_loaitins_on_theloais_id"
  end

  create_table "members", charset: "utf8mb4", force: :cascade do |t|
    t.string "tenTv"
    t.string "sdt"
    t.string "chucVu"
    t.string "id_user"
    t.bigint "doibongs_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doibongs_id"], name: "index_members_on_doibongs_id"
  end

  create_table "owners", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "pass_word"
    t.string "name_bank"
    t.string "number_acc_bank"
    t.string "name_acc_bank"
    t.string "branch_bank"
    t.string "address"
  end

  create_table "pitches", charset: "utf8mb4", force: :cascade do |t|
    t.string "pitch_name"
    t.string "description"
    t.bigint "owners_id", null: false
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "phone_number"
    t.text "url_ggmap"
    t.string "start_time"
    t.string "end_time"
    t.integer "price_per_hour"
    t.integer "size"
    t.text "avatar_url"
    t.index ["owners_id"], name: "index_pitches_on_owners_id"
  end

  create_table "theloais", charset: "utf8mb4", force: :cascade do |t|
    t.string "tenTheLoai"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tintucs", charset: "utf8mb4", force: :cascade do |t|
    t.string "tieuDe"
    t.string "tomTat"
    t.string "noiDung"
    t.string "image"
    t.string "date"
    t.string "noiBat"
    t.bigint "loaitins_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loaitins_id"], name: "index_tintucs_on_loaitins_id"
  end

  create_table "trandaus", charset: "utf8mb4", force: :cascade do |t|
    t.integer "id_db1"
    t.integer "id_db2"
    t.string "time"
    t.date "ngay"
    t.integer "id_user"
    t.string "confirm"
    t.string "string"
    t.integer "id_user2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "address"
    t.string "birthday"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "owners", column: "owners_id"
  add_foreign_key "bookings", "pitches", column: "pitches_id"
  add_foreign_key "bookings", "users", column: "users_id"
  add_foreign_key "loaitins", "theloais", column: "theloais_id"
  add_foreign_key "members", "doibongs", column: "doibongs_id"
  add_foreign_key "pitches", "owners", column: "owners_id"
  add_foreign_key "tintucs", "loaitins", column: "loaitins_id"
end
