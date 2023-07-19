class Serie < ApplicationRecord
  belongs_to :exercise

  enum unit: [:kg, :lbs]

  validates :weight, presence: true
  validates :repetition, presence: true
  validates :is_total_weight, inclusion: [true, false]
  validates :unit, presence: true

  def total_weight
    if is_total_weight then weight else weight*2+exercise.movement_baseline_weight end
  end

  def total_weight_and_unit
    total_weight.to_s + ' ' + unit
  end

  def weight_and_unit
    weight.to_s + ' ' + unit
  end
end
