class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts, dependent: :destroy
  has_many :movements, dependent: :destroy

  enum preferred_unit: [:kg, :lbs]

  validates :preferred_unit, presence: true

  def name
    email.split("@").first.capitalize
  end
end
