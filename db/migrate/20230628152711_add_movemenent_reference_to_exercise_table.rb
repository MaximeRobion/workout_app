class AddMovemenentReferenceToExerciseTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :movemement
  end
end
