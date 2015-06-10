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

ActiveRecord::Schema.define(version: 20150609192844) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "book_exemplars", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_exemplars", ["book_id"], name: "index_book_exemplars_on_book_id"

  create_table "book_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "book_id"
    t.text     "comment"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_orders", ["book_id"], name: "index_book_orders_on_book_id"
  add_index "book_orders", ["cart_id"], name: "index_book_orders_on_cart_id"
  add_index "book_orders", ["user_id"], name: "index_book_orders_on_user_id"

  create_table "books", force: :cascade do |t|
    t.string   "name",                    null: false
    t.integer  "amount"
    t.date     "year"
    t.integer  "author_id"
    t.integer  "genre_id"
    t.integer  "pages_amount"
    t.string   "isbn"
    t.string   "udc"
    t.string   "lbc"
    t.integer  "price"
    t.text     "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"
  add_index "books", ["genre_id"], name: "index_books_on_genre_id"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price",      precision: 15, scale: 2
    t.integer  "cart_id"
    t.integer  "book_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "line_items", ["book_id"], name: "index_line_items_on_book_id"
  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "phone"
    t.text     "address"
    t.integer  "role"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
