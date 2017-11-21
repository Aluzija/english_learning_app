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

ActiveRecord::Schema.define(version: 20171119140611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packets", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_packets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "polish", null: false
    t.string "english", null: false
    t.string "polish_synonyms"
    t.string "english_synonyms"
    t.string "sample_sentence"
    t.integer "repetition", default: 0
    t.integer "packet_id", null: false
    t.index ["english"], name: "index_words_on_english"
    t.index ["packet_id"], name: "index_words_on_packet_id"
    t.index ["polish"], name: "index_words_on_polish"
  end

  add_foreign_key "packets", "users"
end
