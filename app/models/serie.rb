class Serie < ApplicationRecord
  belongs_to :exercise

  enum units: [:kg, :lbs]

  validates :weight, presence: true
  validates :repetition, presence: true
  validates :is_total_weight, inclusion: [true, false]
  validates :units, presence: true

  def total_weight
    if is_total_weight then weight else weight*2+exercise.movement_baseline_weight end
  end
end
