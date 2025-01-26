class BookingEquipment < ApplicationRecord
  belongs_to :booking
  belongs_to :room_equipment
end
