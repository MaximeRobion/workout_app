class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy

  validates :date, presence: true
  validates_associated :exercises

  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(workout) { [workout.user, "workouts"] }, inserts_by: :prepend
end
