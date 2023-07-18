class AddTypeToMovement < ActiveRecord::Migration[7.0]
  def change
    add_column :movements, :type, :integer
  end
end
