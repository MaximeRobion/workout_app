class AddDefaultToWorkoutDate < ActiveRecord::Migration[7.0]
  def change
    change_column_default :workouts, :date, Time.now
  end
end
