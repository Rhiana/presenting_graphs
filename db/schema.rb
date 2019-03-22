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

ActiveRecord::Schema.define(version: 2019_03_22_045008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_graphs", force: :cascade do |t|
    t.integer "maximum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scores", default: [], array: true
  end

  create_table "circle_graphs", force: :cascade do |t|
    t.integer "score"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gauge_graphs", force: :cascade do |t|
    t.integer "score"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_graphs", force: :cascade do |t|
    t.integer "maximum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scores", default: [], array: true
  end

  create_table "pie_graphs", force: :cascade do |t|
    t.integer "score1"
    t.integer "score2"
    t.integer "score3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
