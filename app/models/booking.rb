class Booking < ApplicationRecord
  has_one :user
  has_one :storage_space
  validates :start_date, :end_date, presence: true
  monetize :optional_price_cents, allow_nil: true
end
