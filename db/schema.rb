# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_17_015532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.text "description"
    t.integer "status"
    t.integer "topics_count"
    t.string "url_ata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "description"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_options_on_topic_id"
  end

  create_table "pre_registrations", force: :cascade do |t|
    t.string "cpf"
    t.integer "bloc"
    t.integer "ap"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "assembly_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assembly_id"], name: "index_topics_on_assembly_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.integer "role"
    t.boolean "paid", default: true
    t.bigint "pre_registration_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pre_registration_id"], name: "index_users_on_pre_registration_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_votes_on_option_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "options", "topics"
  add_foreign_key "topics", "assemblies"
  add_foreign_key "users", "pre_registrations"
  add_foreign_key "votes", "options"
  add_foreign_key "votes", "users"
end
