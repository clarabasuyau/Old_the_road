# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

user1 = User.create(
  name: "jean", email: "blabla@gmail.com", phone_number: "097879", password: "1234507"
)
user1.save!

puts 'Creating 15 fake cars...'
15.times do
  car = Car.create!(
    brand_name: Faker::Vehicle.manufacture,
    seats: Faker::Vehicle.engine_size,
    city: Faker::Address.city,
    user: user1
  )
  car.save!
end
puts 'Finished!'
