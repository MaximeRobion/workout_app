class Serie < ApplicationRecord
  belongs_to :exercise

  validates :weight, presence: true
  validates :repetition, presence: true
end
