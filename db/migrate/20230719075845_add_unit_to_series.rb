class AddUnitToSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :series, :unit, :integer, null: false, default: 0
  end
end
