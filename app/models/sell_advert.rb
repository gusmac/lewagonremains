class SellAdvert < ApplicationRecord
  belongs_to :user
  has_one :category
  has_one :storage_space
  validates :condition, inclusion: { in: ["new", "like-new", "used"]}
  validates :title, :description, :address, :condition, presence: true
  monetize :price_cents, allow_nil: true
end
