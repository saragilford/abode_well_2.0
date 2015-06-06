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

ActiveRecord::Schema.define(version: 20150606203914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.integer  "property_owner_id"
    t.string   "address"
    t.string   "neighborhood"
    t.integer  "zip_code"
    t.boolean  "move_in"
    t.boolean  "condo_conv"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "ellis"
    t.string   "orig_address"
  end

  create_table "ellis_acts", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "property_owner_id"
    t.string   "filing_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "eviction_notices", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "tenant_id"
    t.text     "comment"
    t.string   "category"
    t.date     "date_vacate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fix_orders", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "tenant_id"
    t.text     "comment"
    t.integer  "days_unresolved"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "harassments", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "tenant_id"
    t.text     "comment"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "property_owners", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rent_notices", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "tenant_id"
    t.text     "comment"
    t.integer  "prior_rent"
    t.integer  "new_rent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string  "address"
    t.integer "zip_code"
  end

  create_table "tenants", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "name"
    t.string   "user_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
