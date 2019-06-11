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

ActiveRecord::Schema.define(version: 2019_06_10_232050) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "state"
    t.string "city"
    t.string "contact"
    t.integer "club_admin"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_follows_on_tournament_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "count"
    t.datetime "meeting_datetime"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_meetings_on_club_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "likes", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tournament_comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_tournament_comments_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_comments_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.datetime "tournament_datetime"
    t.string "description"
    t.string "events"
    t.integer "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "url"
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_upvotes_on_comment_id"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "user_clubs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "club_id"
    t.boolean "favorite_club"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_user_clubs_on_club_id"
    t.index ["user_id"], name: "index_user_clubs_on_user_id"
  end

  create_table "user_tournaments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_user_tournaments_on_tournament_id"
    t.index ["user_id"], name: "index_user_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "club"
    t.string "state"
    t.string "city"
    t.float "utpr_d"
    t.float "utpr_m"
    t.float "utpr_s"
    t.integer "member_num"
    t.float "skill_d"
    t.float "skill_s"
    t.integer "score", default: 0
    t.string "image"
    t.string "uid"
    t.boolean "admin"
    t.boolean "trainer"
    t.boolean "tournament_director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_notifications", default: true
    t.boolean "desktop_notifications", default: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "follows", "tournaments"
  add_foreign_key "follows", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "meetings", "clubs"
  add_foreign_key "posts", "users"
  add_foreign_key "tournament_comments", "tournaments"
  add_foreign_key "tournament_comments", "users"
  add_foreign_key "upvotes", "comments"
  add_foreign_key "upvotes", "users"
  add_foreign_key "user_clubs", "clubs"
  add_foreign_key "user_clubs", "users"
  add_foreign_key "user_tournaments", "tournaments"
  add_foreign_key "user_tournaments", "users"
end
