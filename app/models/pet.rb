class Pet < ApplicationRecord
  belongs_to :breed
  has_many :profiles, dependent: :destroy 
  has_many :users, through: :profiles

  
  
  def self.get_dogs
    @pets = PETFINDER.animals(type: 'dog', location: '90210')
  end



  # def self.get_pet
  #   @pet = petfinder.animals.first.name
  # end

end
