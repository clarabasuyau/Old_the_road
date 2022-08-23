class Car < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user

  validates :brand_name, :model, :price, :city, :seats, presence: true
end
