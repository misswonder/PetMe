require 'petfinder'
require_relative '../.api_key.rb'

Profile.destroy_all  
Pet.destroy_all
Breed.destroy_all
User.destroy_all
Message.destroy_all
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
        image: animal.photos.first
    )
end

# b1 = Breed.create!(species: "Dog", name: "Pitbull")
# b2 = Breed.create!(species: "Dog", name: "Corgi")
# b3 = Breed.create!(species: "Cat", name: "Persian")
# b4 = Breed.create!(species: "Dog", name: "Husky")
# b5 = Breed.create!(species: "Dog", name: "German Shepherd")
# b6 = Breed.create!(species: "Dog", name: "Golden Retriever")
# b7 = Breed.create!(species: "Cat", name: "Scottish Fold")
# b8 = Breed.create!(species: "Cat", name: "Munchkin cat")


# p1 = Pet.create!(breed_id: b1.id, name: "Choppo", age: "Young", gender: "Male", size: "Large", color: "White/Brown", good_with_children: true, house_trained: true, special_needs: false, temperament: "Friendly")
# p2 = Pet.create!(breed_id: b2.id, name: "Corgi", age: "Adult", gender: "Female", size: "Medium", color: "Brown/Black", good_with_children: true, house_trained: true, special_needs: false, temperament: "Introvert", image: '/images/corgi-1.jpg')
# p3 = Pet.create!(breed_id: b3.id, name: "Diva", age: "Senior", gender: "Female", size: "Small", color: "White", good_with_children: false, house_trained: false, special_needs: false, temperament: "Arrogant")
# p4 = Pet.create!(breed_id: b4.id, name: "Joey", age: "Puppy", gender: "Male", size: "Medium", color: "Black", good_with_children: true, house_trained: false, special_needs: false, temperament: "Playful")
# p5 = Pet.create!(breed_id: b5.id, name: "Bella", age: "Young", gender: "Female", size: "Large", color: "Tawny", good_with_children: true, house_trained: true, special_needs: true, temperament: "Sweet")
# p6 = Pet.create!(breed_id: b6.id, name: "Cooper", age: "Adult", gender: "Male", size: "Medium", color: "Blonde", good_with_children: true, house_trained: true, special_needs: false, temperament: "Energetic")
# p7 = Pet.create!(breed_id: b7.id, name: "Rupert", age: "Young", gender: "Male", size: "Small", color: "Black/White", good_with_children: true, house_trained: true, special_needs: true, temperament: "Shy")
# p8 = Pet.create!(breed_id: b8.id, name: "Shadow", age: "Kitten", gender: "Male", size: "Small", color: "Tabby", good_with_children: true, house_trained: false, special_needs: false, temperament: "Friendly")
# p9 = Pet.create!(breed_id: b1.id, name: "Blue", age: "Adult", gender: "Female", size: "Medium", color: "Black", good_with_children: true, house_trained: false, special_needs: false, temperament: "Courageous")
# p10 = Pet.create!(breed_id: b2.id, name: "Barnie", age: "Young", gender: "Male", size: "Small", color: "Brown", good_with_children: true, house_trained: false, special_needs: false, temperament: "Bubbly", image: '/images/corgi-2.jpg')


u1 = User.create!(username: "Boonie", email:"boonie@gmail.com", password: "12345")
u2 = User.create!(username: "Yvonne", email:"yvonne@gmail.com", password: "ABCDE")
u3 = User.create!(username: "Zach", email:"zach@gmail.com", password: "ZXCVB")
u4 = User.create!(username: "Ashley", email:"ashley@gmail.com", password: "YUIOP")
u5 = User.create!(username: "Michael", email:"michael@gmail.com", password: "GHJKL")
u6 = User.create!(username: "Emily", email:"emily@gmail.com", password: "67890")


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


# m1 = Message.create!(content: "Hi, how can I help you?", conversation_id: c1.id, user_id: u1.id, read: true)
# m2 = Message.create!(content: "Hi, how can I help you?", conversation_id: c2.id, user_id: u2.id, read: false)
# m3 = Message.create!(content: "Hi, how can I help you?", conversation_id: c3.id, user_id: u3.id, read: true)


