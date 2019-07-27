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

ActiveRecord::Schema.define(version: 20190727213950) do

  create_table "beans", force: :cascade do |t|
    t.string   "brand"
    t.string   "variety"
    t.string   "taste_note"
    t.text     "description"
    t.boolean  "organic"
    t.boolean  "fairtrade"
    t.integer  "roaster_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "origin_1"
    t.string   "origin_2"
    t.string   "origin_3"
  end

  create_table "favorite_and_comments", force: :cascade do |t|
    t.boolean  "favorite",   default: false
    t.string   "comments"
    t.integer  "user_id"
    t.integer  "bean_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "roasters", force: :cascade do |t|
    t.string   "roaster_name"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
