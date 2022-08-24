# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

Car.destroy_all
User.destroy_all

user1 = User.create(
  name: "jean", email: "blabla@gmail.com", phone_number: "097879", password: "1234507"
)
user1.save!

puts 'Creating 15 fake cars...'

cars = []
15.times do
  car = Car.create!(
    brand_name: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.model,
    seats: Faker::Vehicle.engine_size,
    city: Faker::Address.city,
    price: rand(50..150).to_s,
    overview: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    user: user1
  )
  car.save!
  cars << car
end
puts 'Finished!'
