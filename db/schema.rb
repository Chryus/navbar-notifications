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

ActiveRecord::Schema.define(version: 20161020142808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forum_posts", force: :cascade do |t|
    t.integer  "forum_thread_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["forum_thread_id"], name: "index_forum_posts_on_forum_thread_id", using: :btree
    t.index ["user_id"], name: "index_forum_posts_on_user_id", using: :btree
  end

  create_table "forum_threads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forum_threads_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["actor_id"], name: "index_notifications_on_actor_id", using: :btree
    t.index ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type", using: :btree
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "forum_posts", "forum_threads"
  add_foreign_key "forum_posts", "users"
  add_foreign_key "forum_threads", "users"
end
