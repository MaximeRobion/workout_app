class AddUnitToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :unit, :integer, null: false, default: 0
  end
end
