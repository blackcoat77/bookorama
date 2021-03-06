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

ActiveRecord::Schema.define(version: 20160629050745) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",         limit: 25
    t.string   "last_name",          limit: 50
    t.string   "email",              limit: 100, default: "", null: false
    t.string   "username",           limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",    limit: 255
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "admin_users_books", id: false, force: :cascade do |t|
    t.integer "admin_user_id", limit: 4
    t.integer "book_id",       limit: 4
  end

  add_index "admin_users_books", ["admin_user_id", "book_id"], name: "index_admin_users_books_on_admin_user_id_and_book_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.string   "isbn",               limit: 13,                                          null: false
    t.string   "author",             limit: 80
    t.string   "title",              limit: 100
    t.decimal  "price",                          precision: 5, scale: 2,                 null: false
    t.boolean  "visible",                                                default: false
    t.string   "description",        limit: 255
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "slug",               limit: 255
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree
  add_index "books", ["isbn"], name: "index_books_on_isbn", unique: true, using: :btree
  add_index "books", ["slug"], name: "index_books_on_slug", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255,                 null: false
    t.boolean  "visible",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",          limit: 255
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

end
