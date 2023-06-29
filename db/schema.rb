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

ActiveRecord::Schema[7.0].define(version: 2023_06_29_072021) do
  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workout_id", null: false
    t.integer "movement_id"
    t.index ["movement_id"], name: "index_exercises_on_movement_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_movements_on_name", unique: true
  end

  create_table "series", force: :cascade do |t|
    t.decimal "weight", precision: 10, scale: 2, null: false
    t.integer "repetition", null: false
    t.integer "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_series_on_exercise_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "date", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercises", "workouts"
  add_foreign_key "series", "exercises"
end
