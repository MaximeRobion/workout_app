class Exercise < ApplicationRecord
  belongs_to :workout
  has_one :movement
  has_many :series, class_name: 'Serie', dependent: :destroy

  validates_associated :series

  scope :ordered, -> { order(id: :asc) }
  def previous_date
    workout.exercises.ordered.where("created_at < ?", created_at).last
  end
end
