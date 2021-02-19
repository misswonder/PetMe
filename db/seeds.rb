require 'petfinder'
require_relative '../.api_key.rb'
  
Pet.destroy_all
Breed.destroy_all
User.destroy_all
Profile.destroy_all
Conversation.destroy_all 

  
PETFINDER = Petfinder::Client.new


#Seed for dogs
dogs, pagination = PETFINDER.animals(type: 'dog', location: '11238', page: 1)

dogs.each do |animal|
    breed = Breed.find_or_create_by!(
        species: animal.species,
        name: animal.breeds["primary"]
    )
    Pet.create!(
        breed_id: breed.id,
        name: animal.name,
        age: animal.age,
        gender: animal.gender,
        size: animal.size,
        color: animal.colors["primary"],
        good_with_children: animal.environment["children"],
        house_trained: animal.attributes["house_trained"],
        special_needs: animal.attributes["special_needs"],
        temperament: animal.tags.join(' ').strip,
        image: animal.photos.first&.full
    )
end

#Seed for cats
cats, pagination = PETFINDER.animals(type: 'cat', location: '11238', page: 1)

cats.each do |animal|
    breed = Breed.find_or_create_by!(
        species: animal.species,
        name: animal.breeds["primary"]
    )
    Pet.create!(
        breed_id: breed.id,
        name: animal.name,
        age: animal.age,
        gender: animal.gender,
        size: animal.size,
        color: animal.colors["primary"],
        good_with_children: animal.environment["children"],
        house_trained: animal.attributes["house_trained"],
        special_needs: animal.attributes["special_needs"],
        temperament: animal.tags.join(' ').strip,
        image: animal.photos.first&.full
    )
end


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com", password: "12345", role: 2)
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com", password: "ABCDE", role: 2)
u3 = User.create!(username: "Zach", email:"zach@gmail.com", password: "ZXCVB", role: 0)
u4 = User.create!(username: "Ashley", email:"ashley@gmail.com", password: "YUIOP", role: 0)
u5 = User.create!(username: "adoptapet", email:"mod@adoptapet.org", password: "GHJKL", role: 1)
u6 = User.create!(username: "paws4paws", email:"mod@paws4paws.com", password: "67890", role: 1)


pro1 = Profile.create!(pet_id: Pet.all[0].id, user_id: u1.id)
pro2 = Profile.create!(pet_id: Pet.all[1].id, user_id: u2.id)
pro3 = Profile.create!(pet_id: Pet.all[2].id, user_id: u3.id)
pro4 = Profile.create!(pet_id: Pet.all[3].id, user_id: u4.id)
pro5 = Profile.create!(pet_id: Pet.all[4].id, user_id: u5.id)
pro6 = Profile.create!(pet_id: Pet.all[5].id, user_id: u6.id)
pro7 = Profile.create!(pet_id: Pet.all[6].id, user_id: u1.id)
pro8 = Profile.create!(pet_id: Pet.all[7].id, user_id: u2.id)
pro9 = Profile.create!(pet_id: Pet.all[8].id, user_id: u3.id)
pro10 = Profile.create!(pet_id: Pet.all[9].id, user_id: u4.id)


c1 = Conversation.create!(sender_id: u1.id, recipient_id: u2.id)
c2 = Conversation.create!(sender_id: u2.id, recipient_id: u3.id)
c3 = Conversation.create!(sender_id: u3.id, recipient_id: u1.id)
c4 = Conversation.create!(sender_id: u4.id, recipient_id: u5.id)
c5 = Conversation.create!(sender_id: u5.id, recipient_id: u6.id)



