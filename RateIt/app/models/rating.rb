class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :vehicle

  validates :user, uniqueness: { scope: :vehicle, message:"this vehicle has been already been rated"}

  
 
end