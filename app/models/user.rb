class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :reviews
  has_many :cars
  # Les voitures que j'ai loué
  has_many :rented_cars, through: :bookings, source: :car, dependent: :destroy
  # Les voitures que j'ai reviews
  has_many :reviewed_cars, through: :reviews, source: :car
  # Les voitures que l'on m'a loué
  has_many :requested_cars, through: :cars, source: :bookings


  validates :name, :phone_number, presence: true
end
