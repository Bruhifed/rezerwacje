class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, :description, :capacity, presence: true
end
