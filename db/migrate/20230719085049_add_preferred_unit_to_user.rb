class AddPreferredUnitToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_unit, :integer, null: false, default: 0
  end
end
