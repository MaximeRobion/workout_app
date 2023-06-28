class ChangeNameOfReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exercises, :movemement
    add_reference :exercises, :movement
  end
end
