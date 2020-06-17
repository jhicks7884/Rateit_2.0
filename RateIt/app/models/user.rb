class User < ApplicationRecord
  
    has_many :vehicles  # those were the vehicles created
    has_many :ratings   
   # has_many :vehicles, through: :ratings


	has_secure_password

    validates :username, :email, uniqueness: true
    validates(:password, { :length => { :in => 4..8 } })
    validates :username, :email, presence: true
    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          #user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end



