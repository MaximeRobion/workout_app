class Exercise < ApplicationRecord
  belongs_to :workout
  has_one :movement
  has_many :series, class_name: 'Serie', dependent: :destroy

  validates_associated :series
end
