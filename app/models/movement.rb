class Movement < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  broadcasts_to ->(movement) { "movements" }, inserts_by: :prepend
end
