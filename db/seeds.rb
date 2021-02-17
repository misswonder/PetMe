# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'petfinder'

# Profile.destroy_all 
# Pet.destroy_all
User.destroy_all
# Breed.destroy_all 

Petfinder.configure do |config|
    config.api_key = 'ESVgrWdR9xyGTq5IuJYlb5FJ6JhZYWb5pUyY7zx5ozrttfgHYS'
    config.api_secret = 'FrA4yn5xeK9O3dAnDKw1uG62fPMnDP38PG53LuXQ'
end
  
PETFINDER = Petfinder::Client.new

animals, pagination = PETFINDER.animals(type: 'dog', location: '90210', page: 1)
# [[animals],[pagination]]

# all_dogs.each do |dog|
#     Pet.create!(
#         name: dog.first.name,
#         age: dog.first.age,
#         gender: dog.first.gender,
#         size: dog.first.size,
#         color: dog.first.colors["primary"],
#         good_with_children: dog.first.environment["children"],
#         house_trained: dog.first.attributes["house_trained"],
#         special_needs: dog.first.attributes["special_needs"],
#         temperament: dog.first.tags.each { |t| puts t }
#     )
# end 


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com", password: "12345")
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com", password: "ABCDE")
u3 = User.create!(username: "Zach", email:"zach@gmail.com", password: "ZXCVB")


# po1 = Profile.create!(pet_id: Pet.all[0].id, user_id: u1.id)
# po2 = Profile.create!(pet_id: Pet.all[1].id, user_id: u2.id)
# po3 = Profile.create!(pet_id: Pet.all[2].id, user_id: u3.id)


