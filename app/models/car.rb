class Car < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :brand_name, :city, :seats, presence: true
end
