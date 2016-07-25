# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160725025437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",        limit: 128, null: false
    t.text     "invite_link"
    t.integer  "leader_id",               null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "campaigns", ["leader_id"], name: "index_campaigns_on_leader_id", using: :btree
  add_index "campaigns", ["location_id"], name: "index_campaigns_on_location_id", using: :btree

  create_table "campaigns_quests", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "quest_id"
  end

  add_index "campaigns_quests", ["campaign_id"], name: "index_campaigns_quests_on_campaign_id", using: :btree
  add_index "campaigns_quests", ["quest_id"], name: "index_campaigns_quests_on_quest_id", using: :btree

  create_table "campaigns_users", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "user_id"
  end

  add_index "campaigns_users", ["campaign_id"], name: "index_campaigns_users_on_campaign_id", using: :btree
  add_index "campaigns_users", ["user_id"], name: "index_campaigns_users_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "campaign_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["campaign_id"], name: "index_pictures_on_campaign_id", using: :btree

  create_table "quests", force: :cascade do |t|
    t.string   "name",        limit: 128,             null: false
    t.text     "description"
    t.integer  "price_range", limit: 2,   default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 64, null: false
    t.text     "email",                          null: false
    t.string   "password_digest",                null: false
    t.text     "bio"
    t.string   "city",                limit: 64
    t.string   "state",               limit: 64
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "first_name",          limit: 32
    t.string   "last_name",           limit: 32
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "campaigns_quests", "campaigns"
  add_foreign_key "campaigns_quests", "quests"
  add_foreign_key "campaigns_users", "campaigns"
  add_foreign_key "campaigns_users", "users"
  add_foreign_key "pictures", "campaigns"
end
