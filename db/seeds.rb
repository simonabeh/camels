require 'faker'

Camel.destroy_all
p "Cleaning camels' database..."
p "Creating new camels"
User.destroy_all
p "Cleaning users' database..."
p "Creating new users"

user_params  = [
  {
    name: Faker::Name.name,
    email: 'simon@example.com',
    password: '123admin',
    age: 20
  },
  {
    name: Faker::Name.name,
    email: 'alex@example.com',
    password: '1234admin',
    age: 25
  }
]

user_params.each do | user_param |
  User.create(user_param)
end

p "There are #{User.count} users"

# Camels db

camel_category = ['Apartment', 'City', 'Desert', 'Mountain', 'Speed Race',
  'Water', 'Friendly Camel', 'Horny Camel', 'Fancy Camel', 'Swaggy Camel']

camel_picture = ["https://res.cloudinary.com/simonabeh/image/upload/v1558948931/camel-1.jpg", "https://res.cloudinary.com/simonabeh/image/upload/v1558948925/camel-2.jpg", "https://res.cloudinary.com/simonabeh/image/upload/v1558948925/camel-3.jpg", "https://res.cloudinary.com/simonabeh/image/upload/v1558948916/camel-4.jpg", "https://res.cloudinary.com/simonabeh/image/upload/v1558948896/camel-5.jpg"]

5.times do camel = Camel.new(name: Faker::FunnyName.name,
            description:  Faker::Quote.yoda,
            category:     camel_category.sample,
            location:     Faker::Address.city,
            price:        rand(100),
            remote_photo_url: camel_picture.sample)
            camel.user = User.first
            camel.save!
end

p "There are #{Camel.count} camels!"
p "Seeds done"
