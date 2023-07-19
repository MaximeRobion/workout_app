class Serie < ApplicationRecord
  belongs_to :exercise

  enum unit: [:kg, :lbs]

  validates :weight, presence: true
  validates :repetition, presence: true
  validates :is_total_weight, inclusion: [true, false]
  validates :unit, presence: true

  # Will need a fix if included again in the UI, since need to take into account everything
  # in the right unit
  # def total_weight
  #   if is_total_weight then weight
  #   else weight*2+exercise.movement_baseline_weight
  #   end
  # end

  # def total_weight_and_unit
  #   total_weight.to_s + ' ' + unit
  # end

  def user_preferred_unit
    exercise.workout.user.preferred_unit
  end

  def weight_in_preferred_unit
    if user_preferred_unit == 'kg' && unit == 'kg' then weight.to_s + ' kg'
    elsif user_preferred_unit == 'kg' && unit == 'lbs' then weight.to_kg.round(2).to_s + ' kg'
    elsif user_preferred_unit == 'lbs' && unit == 'lbs' then weight.to_s + ' lbs'
    elsif user_preferred_unit == 'lbs' && unit == 'kg' then weight.to_lbs.round(2).to_s + ' lbs'
    end
  end
end
