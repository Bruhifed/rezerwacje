class RoomEquipment < ApplicationRecord
  has_many :booking_equipments, dependent: :destroy
  validates :name, :quantity, presence: true
end
