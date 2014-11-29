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

ActiveRecord::Schema.define(version: 20141129043236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: true do |t|
    t.string   "name"
    t.float    "wage"
    t.string   "marital_status"
    t.float    "fica"
    t.float    "fwh"
    t.float    "swh"
    t.integer  "claims"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "fwh_fixed"
  end

  create_table "paychecks", force: true do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "total_hours_worked"
    t.float    "gross_wages"
    t.float    "total_deductions"
    t.float    "net_wages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "fica_deduction"
    t.integer  "fwh_deduction"
    t.float    "swh_deduction"
    t.boolean  "completed"
    t.integer  "select_employees_id"
  end

  add_index "paychecks", ["employee_id", "created_at"], name: "index_paychecks_on_employee_id_and_created_at", using: :btree

end
