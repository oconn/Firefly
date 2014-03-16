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

ActiveRecord::Schema.define(version: 20140316123451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklist_ips", force: true do |t|
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blacklist_ips", ["ip_address"], name: "index_blacklist_ips_on_ip_address", using: :btree

  create_table "comments", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "ip_address"
    t.integer  "post_id"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "photographer_id"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photographers", force: true do |t|
    t.string   "email",                      default: "",    null: false
    t.string   "encrypted_password",         default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photographers", ["email"], name: "index_photographers_on_email", unique: true, using: :btree
  add_index "photographers", ["reset_password_token"], name: "index_photographers_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.integer  "photographer_id"
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_tags", force: true do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visit_details", force: true do |t|
    t.integer  "visit_id"
    t.string   "ip_address", limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visit_details", ["ip_address"], name: "index_visit_details_on_ip_address", using: :btree
  add_index "visit_details", ["visit_id"], name: "index_visit_details_on_visit_id", using: :btree

  create_table "visits", force: true do |t|
    t.integer  "visitable_id"
    t.string   "visitable_type", limit: 30
    t.integer  "total_visits"
    t.integer  "unique_visits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["visitable_id"], name: "index_visits_on_visitable_id", using: :btree
  add_index "visits", ["visitable_type"], name: "index_visits_on_visitable_type", using: :btree

end
