class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name, null: false
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
