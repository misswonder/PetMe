class User < ApplicationRecord
    has_many :profiles, dependent: :destroy 
    has_many :pets, through: :profiles

    has_secure_password

    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
