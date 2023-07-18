class Movement < ApplicationRecord
  belongs_to :user

  enum equipment_type: [:barbell, :dumbell, :machine, :cable]

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :ordered, -> { order(name: :asc) }
  broadcasts_to ->(movement) { [movement.user, "movements"] }, inserts_by: :prepend
end
