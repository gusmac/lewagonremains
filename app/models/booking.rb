class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :storage_space
  validates :start_date, :end_date, presence: true
  monetize :optional_price_cents, allow_nil: true
end
