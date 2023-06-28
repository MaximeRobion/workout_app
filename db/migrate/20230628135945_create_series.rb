class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series do |t|
      t.decimal :weight, precision: 10, scale: 2, null: false
      t.integer :repetition, null: false
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
