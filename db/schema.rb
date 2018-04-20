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

ActiveRecord::Schema.define(version: 20180420065141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "team_1st_id"
    t.bigint "team_2nd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_1st_id"], name: "index_groups_on_team_1st_id"
    t.index ["team_2nd_id"], name: "index_groups_on_team_2nd_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "team_1_id"
    t.bigint "team_2_id"
    t.integer "team_1_score"
    t.integer "team_2_score"
    t.datetime "time"
    t.boolean "result"
    t.string "contact_address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_1_id"], name: "index_matches_on_team_1_id"
    t.index ["team_2_id"], name: "index_matches_on_team_2_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "acronym"
    t.bigint "group_id"
    t.index ["id"], name: "index_teams_on_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "wallet_address"
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "groups", "teams", column: "team_1st_id"
  add_foreign_key "groups", "teams", column: "team_2nd_id"
  add_foreign_key "matches", "teams", column: "team_1_id"
  add_foreign_key "matches", "teams", column: "team_2_id"
  add_foreign_key "teams", "groups"
end
