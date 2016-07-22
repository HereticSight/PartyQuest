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

ActiveRecord::Schema.define(version: 20160722013247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",        limit: 128,             null: false
    t.text     "description"
    t.integer  "price_range", limit: 2,   default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "activities_quests", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "quest_id"
  end

  add_index "activities_quests", ["activity_id"], name: "index_activities_quests_on_activity_id", using: :btree
  add_index "activities_quests", ["quest_id"], name: "index_activities_quests_on_quest_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",        limit: 128, null: false
    t.text     "invite_link"
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "parties", ["user_id"], name: "index_parties_on_user_id", using: :btree

  create_table "parties_users", force: :cascade do |t|
    t.integer "party_id"
    t.integer "user_id"
  end

  add_index "parties_users", ["party_id"], name: "index_parties_users_on_party_id", using: :btree
  add_index "parties_users", ["user_id"], name: "index_parties_users_on_user_id", using: :btree

  create_table "quests", force: :cascade do |t|
    t.string   "name",        limit: 64, null: false
    t.integer  "location_id"
    t.integer  "party_id"
    t.datetime "start_time",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "quests", ["location_id"], name: "index_quests_on_location_id", using: :btree
  add_index "quests", ["party_id"], name: "index_quests_on_party_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 64, null: false
    t.text     "email",                          null: false
    t.string   "password_digest",                null: false
    t.text     "profile_img"
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

  add_foreign_key "activities_quests", "activities"
  add_foreign_key "activities_quests", "quests"
  add_foreign_key "parties", "users"
  add_foreign_key "parties_users", "parties"
  add_foreign_key "parties_users", "users"
  add_foreign_key "quests", "locations"
  add_foreign_key "quests", "parties"
end
