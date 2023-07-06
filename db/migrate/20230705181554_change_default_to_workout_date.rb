class ChangeDefaultToWorkoutDate < ActiveRecord::Migration[7.0]
  def change
    change_column_default :workouts, :date, -> { 'CURRENT_TIMESTAMP' }
  end
end
