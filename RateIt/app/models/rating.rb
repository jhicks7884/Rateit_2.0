class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :vehicle

  validates :user, uniqueness: { scope: :vehicle, message:"this vehicle has been already been rated"}
  
  validates :vehicle_ratings, presence: true


end
