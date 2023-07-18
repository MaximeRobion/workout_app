class AddMovementBaselineWeightToSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :series, :movement_baseline_weight, :decimal, precision: 10, scale: 2, null: false, default: 0
  end
end
