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

ActiveRecord::Schema.define(version: 20140713055049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: true do |t|
    t.integer  "ticket_id"
    t.string   "categorization"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["ticket_id"], name: "index_notes_on_ticket_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.string   "status"
    t.text     "notification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["ticket_id"], name: "index_tasks_on_ticket_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "tickets", force: true do |t|
    t.string   "customernetid"
    t.string   "customermavid"
    t.string   "customername"
    t.string   "customerphone"
    t.string   "customeremail"
    t.boolean  "problem"
    t.string   "category"
    t.text     "resolution"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "description"
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "netid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
