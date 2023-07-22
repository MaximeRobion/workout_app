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

ActiveRecord::Schema[7.0].define(version: 2023_07_19_085049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "workout_id", null: false
    t.bigint "movement_id"
    t.decimal "movement_baseline_weight", precision: 10, scale: 2, null: false
    t.integer "unit", default: 0, null: false
    t.index ["movement_id"], name: "index_exercises_on_movement_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "equipment_type"
    t.index ["name"], name: "index_movements_on_name", unique: true
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.decimal "weight", precision: 10, scale: 2, null: false
    t.integer "repetition", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_total_weight", default: false, null: false
    t.integer "unit", default: 0, null: false
    t.index ["exercise_id"], name: "index_series_on_exercise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "preferred_unit", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercises", "workouts"
  add_foreign_key "movements", "users"
  add_foreign_key "series", "exercises"
  add_foreign_key "workouts", "users"
end
