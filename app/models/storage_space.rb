class StorageSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, :description, :address, presence: true
  monetize :price_cents, allow_nil: true
  # validates :photo, presence: true
end
