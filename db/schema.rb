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

ActiveRecord::Schema.define(version: 2020_04_01_054248) do

  create_table "goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "state", null: false
    t.string "region", null: false
    t.string "postage", null: false
    t.string "expanation", null: false
    t.string "shipping_date", null: false
    t.string "delivery_method", null: false
    t.string "frading_conditions", null: false
    t.integer "price", null: false
    t.integer "category_id", null: false
    t.integer "buyer_id", null: false
    t.integer "saler_id", null: false
    t.integer "size_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end