class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :storage_space
  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ["Pending", "Cancelled", "Confirmed"] }
  monetize :price_cents, allow_nil: true
end
