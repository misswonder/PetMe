class Breed < ApplicationRecord
    has_many :pets, dependent: :destroy
end
