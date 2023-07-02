class Workout < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :date, presence: true
  validates_associated :exercises

  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(workout) { "workouts" }, inserts_by: :prepend
end
