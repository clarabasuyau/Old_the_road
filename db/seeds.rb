# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'
require "open-uri"
require "nokogiri"

# Scrapping start -----------------------------

# html = URI.open("https://www.businessinsider.com/50-once-beloved-cars-that-have-been-discontinued-2019-3?r=US&IR=T").read
# # 1. Parse HTML
# doc = Nokogiri::HTML(html, nil, "utf-8")
# # 2. For the first 15 results
# doc.search(".lazy-holder > img").each do |ele|
#   if ele.attribute('data-srcs')
#     # puts JSON.parse(ele.attribute('data-srcs').value).keys
#     img << JSON.parse(ele.attribute('data-srcs').value).keys
#     i+=1
#   end
# end

# puts doc.search(".figure.image-figure-image img src").to_a
# puts doc.search(".figure.image-figure-image img").attr('src')
# puts img

# better version

img = []
title = []
car_url = ""
car_html = ""
overview = []
seats = []
city = ["Paris", "Bordeaux", "Saint-Tropez"]
city_car = []
i = 0

html = URI.open("https://www.joeyrent.com/classic-cars.php").read
# 1. Parse HTML
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search(".product-image img").each do |ele|
  img << "https://www.joeyrent.com/" + ele.attr("src")
end

html = URI.open("https://www.joeyrent.com/classic-cars.php").read
# 1. Parse HTML
doc = Nokogiri::HTML(html, nil, "utf-8")

doc.search(".product-image a").each_with_index do |ele, index|
  title << ele.attr("href") if index.even?
  car_url = "https://www.joeyrent.com/" + ele.attr("href") if index.even?
  car_html = URI.open(car_url).read
  car_doc = Nokogiri::HTML(car_html, nil, "utf-8")
  seats << car_doc.search(".table > tbody > tr > td").at(1).text if index.even?
  overview << car_doc.search(".col-md-12 p").at(3).text if index.even?
  city_car << city.sample if index.even?
end


# Test  ----------------

# puts img
# puts title
# puts car_url
# puts seats
# puts overview
# puts city_car.count

# ----------------------

# Scrapping start -----------------------------


Booking.destroy_all
Car.destroy_all
User.destroy_all

10.times do
 name = Faker::Name.first_name
 email = Faker::Internet.email
 password = "123456"
 phone_number = "0607080919"
 user = User.create!(name: name, email: email, password: password, phone_number: phone_number)
end
i = 0
cars = []
  15.times do
    car = Car.create!(
      brand_name: title[i],
      model: Faker::Vehicle.model,
      seats: seats[i],
      city: city_car[i],
      price: rand(50..150).to_s,
      picture: img[i],
      overview: overview[i],
      user: User.all.sample,
    )
    i += 1
    cars << car
  end


# cars.each do |car|
#  new_car = Car.new(car)
#  new_car.save!
# end

puts 'Finished!'
