class Vehicle < ApplicationRecord
  validates :vehicle_type, presence: true
  validates :year,  presence: true, length: {minimum: 4}
  validates :make,  presence: true
  validates :model,  presence: true
  validates :style,  presence: true
  

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :user
end