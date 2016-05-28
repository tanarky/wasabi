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

ActiveRecord::Schema.define(version: 20160528132143) do

  create_table "binaries", force: :cascade do |t|
    t.integer  "site_id",      limit: 4
    t.string   "content_type", limit: 255
    t.integer  "size",         limit: 4
    t.string   "name",         limit: 255
    t.binary   "data",         limit: 4294967295
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "binaries", ["site_id", "name"], name: "index_binaries_on_site_id_and_name", unique: true, using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "site_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "pages", ["site_id", "name"], name: "index_pages_on_site_id_and_name", unique: true, using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sites", ["name"], name: "index_sites_on_name", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "site_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tags", ["site_id", "name"], name: "index_tags_on_site_id_and_name", unique: true, using: :btree

end
