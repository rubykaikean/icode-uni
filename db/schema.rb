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

ActiveRecord::Schema.define(version: 20140507080955) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_person_one"
    t.string   "contact_person_two"
    t.string   "contact_person_three"
    t.text     "address"
    t.string   "email"
    t.integer  "contact_number"
    t.string   "client_code"
  end

  add_index "clients", ["client_code"], name: "index_clients_on_client_code", unique: true, using: :btree

  create_table "drawings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estimation_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "estimation_items", force: true do |t|
    t.string   "part_detail"
    t.float    "wt_ibs_ft"
    t.float    "qty"
    t.string   "uom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estimation_id"
    t.integer  "material_id"
    t.float    "dimension_l"
    t.float    "dimension_h"
    t.string   "dimension_w"
    t.string   "thk_dia_um"
    t.float    "unit_price"
    t.string   "thk_dia"
    t.boolean  "status_id",           default: false
    t.string   "description"
    t.integer  "fitting_material_id"
  end

  create_table "estimations", force: true do |t|
    t.integer  "client_id"
    t.string   "title"
    t.string   "dimension"
    t.integer  "drawing_no_id"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
    t.integer  "welding"
    t.integer  "oxygen_acetylene"
    t.integer  "painting"
    t.integer  "sand_blasting"
    t.integer  "transport"
    t.integer  "crane"
    t.integer  "shipment"
    t.integer  "labour"
    t.integer  "installation"
    t.integer  "dismantle"
    t.integer  "machining"
    t.integer  "insulation"
    t.integer  "civil_work"
    t.integer  "electrik"
    t.integer  "piling_work"
    t.integer  "forming"
    t.integer  "misc"
    t.integer  "jkkp"
    t.integer  "project_id"
    t.boolean  "status",           default: false
    t.integer  "user_id"
    t.boolean  "kiv_status",       default: false
  end

  create_table "fitting_materials", force: true do |t|
    t.string   "name"
    t.string   "thk_dia"
    t.string   "brand"
    t.string   "modal"
    t.string   "type_1"
    t.string   "pump_capacity"
    t.string   "head"
    t.string   "material_type"
    t.string   "pump_speed"
    t.string   "fan_speed"
    t.string   "motor_power"
    t.string   "motor_pole"
    t.string   "air_flow"
    t.string   "static_pressure"
    t.string   "other"
    t.string   "remark"
    t.string   "material_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "history_file_deletes", force: true do |t|
    t.string   "title"
    t.string   "dimension"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_management_systems", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.decimal  "plate",            precision: 10, scale: 5
    t.string   "thk_dia"
    t.string   "dimension_w"
    t.string   "thk_dia_um"
    t.string   "material_code"
    t.integer  "price_fomular_id"
    t.decimal  "dimension_h",      precision: 10, scale: 5
    t.decimal  "wt_ibs_ft",        precision: 10, scale: 5
    t.string   "unit_measure"
    t.string   "description"
  end

  add_index "materials", ["material_code"], name: "index_materials_on_material_code", unique: true, using: :btree

  create_table "price_control_items", force: true do |t|
    t.float    "new_unit_price"
    t.date     "new_eff_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_id"
    t.integer  "fitting_material_id"
  end

  create_table "price_controls", force: true do |t|
    t.integer  "pp_no"
    t.date     "pp_date"
    t.integer  "client_id"
    t.string   "reference"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.string   "date"
    t.boolean  "standard",     default: false
    t.boolean  "non_standard", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_code"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.date     "date"
    t.string   "project_code"
    t.boolean  "tenders",      default: false
    t.boolean  "projects",     default: false
  end

  create_table "roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "inventory_management_system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shortened_urls", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type", limit: 20
    t.string   "url",                               null: false
    t.string   "unique_key", limit: 10,             null: false
    t.integer  "use_count",             default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type", using: :btree
  add_index "shortened_urls", ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true, using: :btree
  add_index "shortened_urls", ["url"], name: "index_shortened_urls_on_url", using: :btree

  create_table "stations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.boolean  "admin"
    t.boolean  "status"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
