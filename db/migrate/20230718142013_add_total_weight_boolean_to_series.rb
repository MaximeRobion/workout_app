class AddTotalWeightBooleanToSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :series, :is_total_weight, :boolean, null: false, default: false
  end
end
