class Serie < ApplicationRecord
  belongs_to :exercise

  validates :weight, presence: true
  validates :repetition, presence: true
  validates :is_total_weight, inclusion: [true, false]

  def total_weight
    if is_total_weight then weight else weight*2+exercise.movement_baseline_weight end
  end
end
