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

ActiveRecord::Schema.define(version: 20221030000415) do

  create_table "markets", force: :cascade do |t|
    t.string  "name"
    t.string  "category"
    t.decimal "price"
    t.integer "calories"
    t.integer "number"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: :cascade do |t|
    t.string  "name"
    t.integer "number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.decimal  "height"
    t.decimal  "weight"
    t.integer  "age"
    t.string   "gender"
    t.string   "sports_level"
    t.integer  "number1"
    t.integer  "number2"
    t.integer  "number3"
    t.integer  "number4"
    t.integer  "number5"
    t.integer  "number6"
    t.integer  "number7"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
