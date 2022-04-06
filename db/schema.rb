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

ActiveRecord::Schema.define(version: 2022_04_04_005929) do

  create_table "badges", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "earned", default: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "benefits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tea_benefits", force: :cascade do |t|
    t.integer "tea_id", null: false
    t.integer "benefit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["benefit_id"], name: "index_tea_benefits_on_benefit_id"
    t.index ["tea_id"], name: "index_tea_benefits_on_tea_id"
  end

  create_table "tea_ingredients", force: :cascade do |t|
    t.integer "tea_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_tea_ingredients_on_ingredient_id"
    t.index ["tea_id"], name: "index_tea_ingredients_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "name"
    t.text "preparation"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_teas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tea_id", null: false
    t.boolean "tasted", default: false
    t.boolean "favorite", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tea_id"], name: "index_user_teas_on_tea_id"
    t.index ["user_id"], name: "index_user_teas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tea_benefits", "benefits"
  add_foreign_key "tea_benefits", "teas"
  add_foreign_key "tea_ingredients", "ingredients"
  add_foreign_key "tea_ingredients", "teas"
  add_foreign_key "user_teas", "teas"
  add_foreign_key "user_teas", "users"
end
