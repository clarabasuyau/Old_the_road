class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :reviews
  has_many :cars, through: :bookings, dependent: :destroy
  has_many :cars, through: :reviews, dependent: :destroy
  validates :name, :phone_number, :email, presence: true
end
