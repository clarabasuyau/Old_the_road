class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_rent, :end_rent, :message, presence: true
end
