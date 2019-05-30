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

ActiveRecord::Schema.define(version: 2019_05_30_180507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "achievements", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.string "reference_url"
    t.text "excerpt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "published", default: true
  end

  create_table "artist_artworks", id: :serial, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "artwork_id"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "artwork_id"], name: "index_artist_artworks_on_artist_id_and_artwork_id", unique: true
  end

  create_table "artists", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.string "quote", null: false
    t.text "bio"
    t.date "birth_date"
    t.string "birth_place", null: false
    t.boolean "shows_contact_information"
    t.string "email"
    t.string "twitter_username"
    t.string "facebook_username"
    t.string "phone_number"
    t.text "list_of_tags"
    t.string "artwork_trajectory_since"
    t.string "artwork_count"
    t.string "artwork_trajectory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "artworks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.string "credits"
    t.float "width"
    t.float "height"
    t.string "disposition_on_landing_page"
    t.boolean "published"
    t.text "list_of_tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "picture_in_sections", id: :serial, force: :cascade do |t|
    t.integer "picture_id"
    t.text "sections", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sections"], name: "index_picture_in_sections_on_sections", using: :gin
  end

  create_table "pictures", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.integer "year"
    t.string "credits"
    t.float "width"
    t.float "height"
    t.point "location"
    t.string "disposition_on_landing_page"
    t.text "list_of_tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "published", default: true
  end

  create_table "promoted_categories", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.integer "order"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_for_pages", id: :serial, force: :cascade do |t|
    t.string "page_identifier"
    t.string "title"
    t.text "description"
    t.string "keywords"
    t.string "image_url"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", id: :serial, force: :cascade do |t|
    t.string "style"
    t.integer "index"
    t.string "first_heading"
    t.string "second_heading"
    t.string "third_heading"
    t.boolean "is_enabled"
    t.string "url"
    t.string "image_url"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tags_on_category_id"
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
