# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.destroy_all 
Pet.destroy_all
User.destroy_all
Breed.destroy_all 


b1 = Breed.create!(species: "Dog", name: "Pitbull")
b2 = Breed.create!(species: "Dog", name: "Corgi")
b3 = Breed.create!(species: "Cat", name: "Persian")

p1 = Pet.create!(breed_id: b1.id, name: "Choppo", age: "Young", gender: "Male", size: "Large", color: "White/Brown", good_with_children: true, house_trained: true, special_needs: false, temperament: "Friendly")
p2 = Pet.create!(breed_id: b2.id, name: "Corgi", age: "Adult", gender: "Female", size: "Medium", color: "Creamy", good_with_children: true, house_trained: true, special_needs: false, temperament: "Introvert")
p3 = Pet.create!(breed_id: b3.id, name: "Diva", age: "Senior", gender: "Female", size: "Small", color: "White", good_with_children: false, house_trained: false, special_needs: false, temperament: "Arrogant")


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com")
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com")
u3 = User.create!(username: "Zach", email:"zach@gmail.com")


po1 = Profile.create!(pet_id: p1.id, user_id: u1.id)
po2 = Profile.create!(pet_id: p2.id, user_id: u2.id)
po3 = Profile.create!(pet_id: p3.id, user_id: u3.id)


