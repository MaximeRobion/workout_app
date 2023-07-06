class Movement < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :ordered, -> { order(name: :asc) }
  broadcasts_to ->(movement) { "movements" }, inserts_by: :prepend
end
