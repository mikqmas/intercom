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

ActiveRecord::Schema.define(version: 20180216064241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authtokens", force: :cascade do |t|
    t.string "uuid"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_authtokens_on_merchant_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "role"
    t.boolean "isOwner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_employees_on_name"
    t.index ["uuid"], name: "index_employees_on_uuid", unique: true
  end

  create_table "employees_groups", id: false, force: :cascade do |t|
    t.integer "employee_id"
    t.integer "group_id"
    t.index ["employee_id"], name: "index_employees_groups_on_employee_id"
    t.index ["group_id", "employee_id"], name: "group_employee_un", unique: true
    t.index ["group_id"], name: "index_employees_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_merchants_on_name"
    t.index ["uuid"], name: "index_merchants_on_uuid", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "body", limit: 120
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_messages_on_employee_id"
  end

  add_foreign_key "messages", "employees"
end
