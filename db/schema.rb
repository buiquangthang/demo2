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

ActiveRecord::Schema.define(version: 20161212082843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "action"
    t.integer  "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.boolean  "is_correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "micropost_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "learns", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "lesson_id"
    t.boolean  "is_correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["answer_id"], name: "index_learns_on_answer_id", using: :btree
    t.index ["lesson_id"], name: "index_learns_on_lesson_id", using: :btree
    t.index ["question_id"], name: "index_learns_on_question_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_lessons_on_category_id", using: :btree
    t.index ["user_id"], name: "index_lessons_on_user_id", using: :btree
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_questions_on_category_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "category"
    t.boolean  "learn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "popularity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "activities", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "users"
  add_foreign_key "learns", "answers"
  add_foreign_key "learns", "lessons"
  add_foreign_key "learns", "questions"
  add_foreign_key "lessons", "categories"
  add_foreign_key "lessons", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "questions", "categories"
end
