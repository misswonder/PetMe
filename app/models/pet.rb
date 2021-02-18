class Pet < ApplicationRecord
  belongs_to :breed
  has_many :profiles, dependent: :destroy 
  has_many :users, through: :profiles
end
