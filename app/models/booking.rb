class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_rent, :end_rent, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2 }
end
