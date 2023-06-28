class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.datetime :date, null: false
      t.text :note

      t.timestamps
    end
  end
end
