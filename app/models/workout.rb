class Workout < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :date, presence: true
  validates_associated :exercises
end
