class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :storage_space
  validates :start_date, :end_date, :storage_space, presence: true
  validates :status, inclusion: { in: ["pending", "cancelled", "confirmed"] }
  monetize :price_cents, allow_nil: true
end
