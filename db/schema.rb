# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_06_123848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "embeds", force: :cascade do |t|
    t.integer "media_type"
    t.string "media_url"
    t.text "description"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_embeds_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "level_part_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vibrate"
    t.string "audio"
    t.string "alphabet_name"
    t.string "title", null: false
    t.text "description"
    t.string "points", default: [], array: true
    t.string "sample_image"
    t.text "big_char_point"
    t.text "small_char_point"
    t.index ["level_part_id"], name: "index_lessons_on_level_part_id"
  end

  create_table "level_parts", force: :cascade do |t|
    t.integer "level"
    t.integer "part"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
  end

  create_table "multiple_choice_challengers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "level_part_id", null: false
    t.integer "score"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.index ["level_part_id"], name: "index_multiple_choice_challengers_on_level_part_id"
    t.index ["user_id"], name: "index_multiple_choice_challengers_on_user_id"
  end

  create_table "multiple_choice_judgements", force: :cascade do |t|
    t.bigint "multiple_choice_challenger_id", null: false
    t.bigint "multiple_choice_question_id", null: false
    t.integer "judgement", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["multiple_choice_challenger_id"], name: "multiple_choice_challengers_judgement"
    t.index ["multiple_choice_question_id"], name: "index_multiple_choice_judgements_on_multiple_choice_question_id"
  end

  create_table "multiple_choice_question_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "multiple_choice_question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["multiple_choice_question_id"], name: "multiple_choice_question_tags_index"
    t.index ["tag_id"], name: "index_multiple_choice_question_tags_on_tag_id"
  end

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "level_part_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["level_part_id"], name: "index_multiple_choice_questions_on_level_part_id"
  end

  create_table "multiple_choices", force: :cascade do |t|
    t.boolean "is_answer", default: false, null: false
    t.string "body", null: false
    t.bigint "multiple_choice_question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["multiple_choice_question_id"], name: "index_multiple_choices_on_multiple_choice_question_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "embeds", "lessons"
  add_foreign_key "lessons", "level_parts"
  add_foreign_key "multiple_choice_challengers", "level_parts"
  add_foreign_key "multiple_choice_challengers", "users"
  add_foreign_key "multiple_choice_judgements", "multiple_choice_challengers"
  add_foreign_key "multiple_choice_judgements", "multiple_choice_questions"
  add_foreign_key "multiple_choice_question_tags", "multiple_choice_questions"
  add_foreign_key "multiple_choice_question_tags", "tags"
  add_foreign_key "multiple_choice_questions", "level_parts"
  add_foreign_key "multiple_choices", "multiple_choice_questions"
end
