class Workout < ApplicationRecord
  validates :date, presence: true
  has_many :exercises
end
