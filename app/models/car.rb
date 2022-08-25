class Car < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  validates :brand_name, :model, :price, :city, :seats, presence: true
end
