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

ActiveRecord::Schema.define(version: 20150706142652) do

  create_table "agents", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "banks", force: :cascade do |t|
    t.integer  "swift_number", limit: 2
    t.string   "name",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "card_levels", force: :cascade do |t|
    t.integer  "agent_id",   limit: 4
    t.integer  "level",      limit: 1
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "card_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "bank_id",       limit: 4
    t.integer  "card_type_id",  limit: 4
    t.integer  "card_level_id", limit: 4
    t.string   "reference",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",          limit: 255
  end

  create_table "clicks", force: :cascade do |t|
    t.string   "target_type", limit: 255
    t.integer  "target_id",   limit: 4
    t.integer  "count",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "discount_requirement_sets", force: :cascade do |t|
    t.integer  "discount_id",   limit: 4
    t.integer  "bank_id",       limit: 4
    t.integer  "card_id",       limit: 4
    t.integer  "card_level_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "discount_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer  "group_id",             limit: 4
    t.integer  "store_id",             limit: 4
    t.integer  "discount_index",       limit: 1
    t.integer  "discount_type_id",     limit: 1
    t.string   "brief_description",    limit: 255
    t.text     "complete_description", limit: 65535
    t.string   "notice",               limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "rating",               limit: 1
    t.string   "reference",            limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "group_sets", force: :cascade do |t|
    t.integer  "group_id",      limit: 4
    t.integer  "store_info_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "store_infos", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "country",        limit: 255
    t.string   "city",           limit: 255
    t.string   "district",       limit: 255
    t.integer  "zip",            limit: 2
    t.string   "street",         limit: 255
    t.string   "phone",          limit: 255
    t.string   "official_site",  limit: 255
    t.string   "rate_reference", limit: 255
    t.integer  "rating",         limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
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
    t.string   "account",                limit: 255
    t.integer  "privilege",              limit: 4
    t.string   "gender",                 limit: 255
    t.date     "birthday"
    t.string   "city",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "card_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
