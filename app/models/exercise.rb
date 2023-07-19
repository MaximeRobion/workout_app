class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :movement
  has_many :series, class_name: 'Serie', dependent: :destroy

  enum unit: [:kg, :lbs]

  validates_associated :series
  validates :movement_baseline_weight, presence: true
  validates :unit, presence: true

  scope :ordered, -> { order(id: :asc) }

  def previous_date
    workout.exercises.ordered.where("created_at < ?", created_at).last
  end

  def baseline_weight_and_unit
    movement_baseline_weight.to_s + ' ' + unit
  end
end
