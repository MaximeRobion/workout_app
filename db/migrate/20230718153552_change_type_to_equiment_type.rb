class ChangeTypeToEquimentType < ActiveRecord::Migration[7.0]
  def change
    rename_column :movements, :type, :equipment_type
  end
end
