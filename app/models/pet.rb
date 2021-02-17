class Pet < ApplicationRecord
  belongs_to :breed
  has_many :profiles, dependent: :destroy 
  has_many :users, through: :profiles

  Petfinder.configure do |config|
    config.api_key = 'ESVgrWdR9xyGTq5IuJYlb5FJ6JhZYWb5pUyY7zx5ozrttfgHYS'
    config.api_secret = 'FrA4yn5xeK9O3dAnDKw1uG62fPMnDP38PG53LuXQ'
  end
  
  PETFINDER = Petfinder::Client.new
  
  def self.get_dogs
    @pets = PETFINDER.animals(type: 'dog', location: '90210')
  end



  # def self.get_pet
  #   @pet = petfinder.animals.first.name
  # end

end
