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

ActiveRecord::Schema.define(version: 20170126140643) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "title"
    t.index ["title"], name: "index_articles_on_title", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "liker_id"
    t.integer  "liked_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "liked_comment_id"
    t.index ["liked_article_id"], name: "index_likes_on_liked_article_id", using: :btree
    t.index ["liked_comment_id"], name: "index_likes_on_liked_comment_id", using: :btree
    t.index ["liker_id", "liked_article_id"], name: "index_likes_on_liker_id_and_liked_article_id", using: :btree
    t.index ["liker_id", "liked_comment_id"], name: "index_likes_on_liker_id_and_liked_comment_id", using: :btree
    t.index ["liker_id"], name: "index_likes_on_liker_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
  end

  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
end
