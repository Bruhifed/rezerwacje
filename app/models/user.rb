class User < ApplicationRecord
  has_secure_password

  has_many :bookings, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  enum :role, { user: "user", admin: "admin" }
end
