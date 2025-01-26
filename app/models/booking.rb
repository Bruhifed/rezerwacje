class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :booking_equipments, dependent: :destroy
  has_many :room_equipments, through: :booking_equipments

  validates :start_date, :end_date, presence: true

  validate :validate_booking_dates

  scope :upcoming, -> { where('start_date >= ?', Date.today) }

  private

  def validate_booking_dates
    return if start_date.blank? || end_date.blank?

    overlapping_bookings = Booking.where(room_id: room_id)
                                  .where('start_date <= ? AND end_date >= ?', end_date, start_date)
                                  .where.not(id: id)
    if overlapping_bookings.exists?
      errors.add(:base, 'Pokój jest już zarezerwowany na tę datę.')
    end
  end

end
