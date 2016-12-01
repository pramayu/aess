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

ActiveRecord::Schema.define(version: 20161201073552) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "event_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "image",       limit: 255
    t.integer  "event_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
  end

  add_index "galleries", ["category_id"], name: "index_galleries_on_category_id", using: :btree
  add_index "galleries", ["event_id"], name: "index_galleries_on_event_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slider",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "testimonis", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "content",    limit: 255
    t.string   "avatar",     limit: 255
    t.string   "occupation", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 50
    t.string   "email",           limit: 100
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
  end

  add_foreign_key "events", "users"
  add_foreign_key "galleries", "categories"
  add_foreign_key "galleries", "events"
end
