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

ActiveRecord::Schema.define(version: 20141010093859) do

  create_table "ratings", force: true do |t|
    t.text     "comment"
    t.integer  "weight"
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deleted"
    t.integer  "user_id"
  end

  create_table "things", force: true do |t|
    t.text "name"
    t.text "image_meta_data"
  end

  create_table "things_users", id: false, force: true do |t|
    t.integer "thing_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "twitter"
    t.string "password_digest"
    t.string "confirmation_token"
    t.text   "image_meta_data"
  end

end
