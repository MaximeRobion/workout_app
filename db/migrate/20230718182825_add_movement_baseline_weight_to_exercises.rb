class AddMovementBaselineWeightToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :movement_baseline_weight, :decimal, precision: 10, scale: 2, null: false, default: 0
  end
end
