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

  def user_preferred_unit
    workout.user.preferred_unit
  end

  def baseline_weight_in_preferred_unit
    if user_preferred_unit == 'kg' && unit == 'kg' then movement_baseline_weight.to_s + ' kg'
    elsif user_preferred_unit == 'kg' && unit == 'lbs' then movement_baseline_weight.to_kg.round(2).to_s + ' kg'
    elsif user_preferred_unit == 'lbs' && unit == 'lbs' then movement_baseline_weight.to_s + ' lbs'
    elsif user_preferred_unit == 'lbs' && unit == 'kg' then movement_baseline_weight.to_lbs.round(2).to_s + ' lbs'
    end
  end
end
