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

ActiveRecord::Schema.define(version: 20160501013126) do

  create_table "appoint_clienships", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "client_id"
    t.string   "creator"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "appoint_clienships", ["appointment_id"], name: "index_appoint_clienships_on_appointment_id"
  add_index "appoint_clienships", ["client_id"], name: "index_appoint_clienships_on_client_id"

  create_table "appointments", force: :cascade do |t|
    t.integer  "clinic_id"
    t.integer  "client_id"
    t.text     "comment"
    t.datetime "date"
    t.string   "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id"
  add_index "appointments", ["clinic_id"], name: "index_appointments_on_clinic_id"

  create_table "assaignments", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "professional_id"
    t.string   "creator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "assaignments", ["appointment_id"], name: "index_assaignments_on_appointment_id"
  add_index "assaignments", ["professional_id"], name: "index_assaignments_on_professional_id"

  create_table "client_professionals", force: :cascade do |t|
    t.integer  "professional_id"
    t.integer  "client_id"
    t.string   "creator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "client_professionals", ["client_id"], name: "index_client_professionals_on_client_id"
  add_index "client_professionals", ["professional_id"], name: "index_client_professionals_on_professional_id"

  create_table "clients", force: :cascade do |t|
    t.integer  "clinic_id"
    t.string   "name"
    t.string   "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["clinic_id"], name: "index_clients_on_clinic_id"

  create_table "clinics", force: :cascade do |t|
    t.string   "name"
    t.string   "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.integer  "professional_id"
    t.integer  "clinic_id"
    t.string   "creator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "employments", ["clinic_id"], name: "index_employments_on_clinic_id"
  add_index "employments", ["professional_id"], name: "index_employments_on_professional_id"

  create_table "professionals", force: :cascade do |t|
    t.string   "name"
    t.string   "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
