class DeleteDefaultInMovementBaselineWeight < ActiveRecord::Migration[7.0]
  def change
    change_column_default :exercises, :movement_baseline_weight, nil
  end
end
