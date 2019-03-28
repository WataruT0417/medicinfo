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

ActiveRecord::Schema.define(version: 2019_03_27_235057) do

  create_table "doubts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "title"
    t.date "reported_at"
    t.string "doctor", limit: 100
    t.text "detail"
    t.string "report_staff", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approval_flg", default: false
  end

  create_table "medicines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "title"
    t.date "reported_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_staff", limit: 20
    t.text "detail"
    t.string "source"
    t.string "report_staff", limit: 20
    t.boolean "approval_flg", default: false
  end

  create_table "reactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "title"
    t.date "reported_at"
    t.string "doctor", limit: 100
    t.string "patient_id", limit: 10
    t.string "patient_name", limit: 100
    t.text "detail"
    t.string "report_staff", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approval_flg", default: false
  end

  create_table "staffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
