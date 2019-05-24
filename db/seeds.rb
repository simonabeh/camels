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

# camel_category = ['Apartment', 'City', 'Desert', 'Mountain', 'Speed Race',
#   'Water', 'Friendly Camel', 'Horny Camel', 'Fancy Camel', 'Swaggy Camel']

# 5.times do camel = Camel.new(name: Faker::FunnyName.name,
#             description:  Faker::Quote.yoda,
#             category:     camel_category.sample,
#             location:     Faker::Address.city,
#             price:        rand(100),
#             photo:        "https://images.unsplash.com/photo-1549468057-5b7fa1a41d7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80")
#             camel.user = User.first
#             camel.save!
# end

p "There are #{Camel.count} camels!"
p "Seeds done"
