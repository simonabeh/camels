require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Users db

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

Camel.destroy_all
p "Cleaning camels' database..."
p "Creating new camels"

5.times do camel = Camel.new(name: Faker::FunnyName.name,
            description:  Faker::Quote.yoda,
            category:     camel_category.sample,
            location:     Faker::Address.city,
            price:        rand(100))
            camel.user = User.first
            camel.save!
end

p "There are #{Camel.count} camels!"
p "Seeds done"

