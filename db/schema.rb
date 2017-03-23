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

ActiveRecord::Schema.define(version: 20170323103927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creeps", force: :cascade do |t|
    t.string   "creeper_type"
    t.integer  "creeper_id"
    t.string   "creepable_type"
    t.integer  "creepable_id"
    t.datetime "created_at"
    t.index ["creepable_id", "creepable_type"], name: "fk_creepables", using: :btree
    t.index ["creeper_id", "creeper_type"], name: "fk_creeps", using: :btree
  end

  create_table "grunts", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grunts_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
    t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "email"
    t.string   "photo_url"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "creepees_count",  default: 0
    t.integer  "creepers_count",  default: 0
    t.integer  "grunts_count",    default: 0
  end

  add_foreign_key "grunts", "users"
end
