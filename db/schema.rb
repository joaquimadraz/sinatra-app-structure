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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "btree_gist"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "unaccent"

  create_table "modules", id: false, force: :cascade do |t|
    t.text "file",   null: false
    t.text "digest"
  end

  create_table "schema", id: false, force: :cascade do |t|
    t.text "version", null: false
  end

  create_table "structuredefinition_elements", id: false, force: :cascade do |t|
    t.text    "structuredefinition_id", null: false
    t.text    "path",                   null: false, array: true
    t.text    "min"
    t.text    "max"
    t.text    "type",                                array: true
    t.text    "formal"
    t.text    "comments"
    t.boolean "issummary"
    t.text    "ref_type",                            array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "avatar_url"
    t.string   "email"
    t.string   "name"
    t.string   "twitter_uid"
    t.string   "twitter_handler"
    t.boolean  "registration_complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
