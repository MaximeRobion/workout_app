class Serie < ApplicationRecord
  belongs_to :exercise

  validates :weight, presence: true
  validates :repetition, presence: true
  validates :is_total_weight, inclusion: [true, false]
end
