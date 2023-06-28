class Exercise < ApplicationRecord
  belongs_to :workout

  has_one :movement
  has_many :series
end
