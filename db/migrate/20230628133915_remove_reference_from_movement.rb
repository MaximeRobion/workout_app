class RemoveReferenceFromMovement < ActiveRecord::Migration[7.0]
  def change
    remove_reference :movements, :exercise, foreign_key: true, index: false
  end
end
