class RemoveMovementBaselineWeightFromSeries < ActiveRecord::Migration[7.0]
  def change
    remove_column :series, :movement_baseline_weight
  end
end
