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

ActiveRecord::Schema.define(version: 20161019013829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "dev_corner_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.boolean  "user_agree"
    t.boolean  "dev_agree"
    t.float    "cost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["dev_corner_id"], name: "index_contracts_on_dev_corner_id", using: :btree
    t.index ["profile_id"], name: "index_contracts_on_profile_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "dev_corners", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "skills"
    t.text     "experience"
    t.text     "strengths"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "user_css_input"
    t.text     "user_html_input"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_dev_corners_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_dev_corners_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_dev_corners_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_dev_corners_on_cached_votes_up", using: :btree
    t.index ["profile_id"], name: "index_dev_corners_on_profile_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "contracts", "dev_corners"
  add_foreign_key "contracts", "profiles"
  add_foreign_key "dev_corners", "profiles"
  add_foreign_key "profiles", "users"
end
