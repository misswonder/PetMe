class User < ApplicationRecord
    has_many :profiles, dependent: :destroy 
    has_many :pets, through: :profiles
end
