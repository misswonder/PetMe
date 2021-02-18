# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'petfinder'
require_relative '../.api_key.rb'

# Profile.destroy_all 
# Pet.destroy_all
User.destroy_all
# Breed.destroy_all 

  
PETFINDER = Petfinder::Client.new

animals, pagination = PETFINDER.animals(type: 'dog', location: '90210', page: 1)

# ap animals.first
# [[animals],[pagination]]

animals.each do |animal|
    Pet.create!(
        name: animal.name,
        age: animal.age,
        gender: animal.gender,
        size: animal.size,
        color: animal.colors["primary"],
        good_with_children: animal.environment["children"],
        house_trained: animal.attributes["house_trained"],
        special_needs: animal.attributes["special_needs"],
        temperament: animal.tags.join(' ').strip
    )
end 


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com", password: "12345")
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com", password: "ABCDE")
u3 = User.create!(username: "Zach", email:"zach@gmail.com", password: "ZXCVB")


# po1 = Profile.create!(pet_id: Pet.all[0].id, user_id: u1.id)
# po2 = Profile.create!(pet_id: Pet.all[1].id, user_id: u2.id)
# po3 = Profile.create!(pet_id: Pet.all[2].id, user_id: u3.id)


