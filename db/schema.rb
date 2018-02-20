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

ActiveRecord::Schema.define(version: 20180216063957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authtokens", force: :cascade do |t|
    t.string "token"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_authtokens_on_merchant_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", limit: 30
    t.string "description", limit: 100
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_groups_on_merchant_id"
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "uuid", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_merchants_on_uuid", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "body", limit: 140
    t.string "to_id", limit: 20
    t.string "from_id", limit: 20
    t.bigint "group_id"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_messages_on_from_id"
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["merchant_id"], name: "index_messages_on_merchant_id"
    t.index ["to_id"], name: "index_messages_on_to_id"
  end

end
