class BuyAdvert < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  monetize :price_cents, allow_nil: true
end
