require 'petfinder'

Profile.destroy_all 
Pet.destroy_all
User.destroy_all
Breed.destroy_all 

Petfinder.configure do |config|
    config.api_key = 'ESVgrWdR9xyGTq5IuJYlb5FJ6JhZYWb5pUyY7zx5ozrttfgHYS'
    config.api_secret = 'FrA4yn5xeK9O3dAnDKw1uG62fPMnDP38PG53LuXQ'
end

PETFINDER = Petfinder::Client.new

#Seed for dogs
dogs, pagination = PETFINDER.animals(type: 'dog', location: '90210', page: 1)

dogs.each do |animal|
    Breed.create!(
        species: animal.species,
        name: animal.breeds["primary"]
    )
end
dogs.each_with_index do |animal, i|
    Pet.create!(
        breed_id: i+1,
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

#Seed for cats
cats, pagination = PETFINDER.animals(type: 'cat', location: '90210', page: 1)

cats.each do |animal|
    Breed.create!(
        species: animal.species,
        name: animal.breeds["primary"]
    )
end
cats.each_with_index do |animal, i|
    Pet.create!(
        breed_id: i+1,
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

# b1 = Breed.create!(species: "Dog", name: "Pitbull")
# b2 = Breed.create!(species: "Dog", name: "Corgi")
# b3 = Breed.create!(species: "Cat", name: "Persian")

# p1 = Pet.create!(breed_id: b1.id, name: "Choppo", age: "Young", gender: "Male", size: "Large", color: "White/Brown", good_with_children: true, house_trained: true, special_needs: false, temperament: "Friendly")
# p2 = Pet.create!(breed_id: b2.id, name: "Corgi", age: "Adult", gender: "Female", size: "Medium", color: "Creamy", good_with_children: true, house_trained: true, special_needs: false, temperament: "Introvert")
# p3 = Pet.create!(breed_id: b3.id, name: "Diva", age: "Senior", gender: "Female", size: "Small", color: "White", good_with_children: false, house_trained: false, special_needs: false, temperament: "Arrogant")


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com", password: "12345")
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com", password: "ABCDE")
u3 = User.create!(username: "Zach", email:"zach@gmail.com", password: "ZXCVB")


# po1 = Profile.create!(pet_id: p1.id, user_id: u1.id)
# po2 = Profile.create!(pet_id: p2.id, user_id: u2.id)
# po3 = Profile.create!(pet_id: p3.id, user_id: u3.id)


