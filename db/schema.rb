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

ActiveRecord::Schema.define(version: 20151215203413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "profile_id"
  end

  add_index "friends", ["profile_id"], name: "index_friends_on_profile_id", using: :btree
  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "gatherings", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "location",    null: false
    t.date     "date",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "gatherings", ["user_id"], name: "index_gatherings_on_user_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "gathering_id"
    t.integer  "profile_id"
  end

  add_index "invitations", ["gathering_id"], name: "index_invitations_on_gathering_id", using: :btree
  add_index "invitations", ["profile_id"], name: "index_invitations_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "fname",      null: false
    t.string   "lname",      null: false
    t.string   "zip_code",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "profile_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "friends", "profiles"
  add_foreign_key "friends", "users"
  add_foreign_key "gatherings", "users"
  add_foreign_key "invitations", "gatherings"
  add_foreign_key "invitations", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "profiles"
end
