class Serie < ApplicationRecord
  belongs_to :exercise
  validates :weigth, presence: true
  validates :repetition, presence: true
end
