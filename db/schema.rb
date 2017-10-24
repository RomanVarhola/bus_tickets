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

ActiveRecord::Schema.define(version: 20170508161901) do

  create_table "journeys", force: :cascade do |t|
    t.integer  "count_of_seats",     limit: 4
    t.string   "place_of_departure", limit: 255
    t.datetime "date_of_departure"
    t.string   "place_of_arrive",    limit: 255
    t.datetime "date_of_arrive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journeys_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "journey_id", limit: 4, null: false
  end

  add_index "journeys_users", ["journey_id", "user_id"], name: "index_journeys_users_on_journey_id_and_user_id", using: :btree
  add_index "journeys_users", ["user_id", "journey_id"], name: "index_journeys_users_on_user_id_and_journey_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journey_id", limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "date_of_station"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journey_id",      limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "city",                   limit: 255
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "fk_rails_642f17018b", using: :btree

  add_foreign_key "users", "roles"
end
