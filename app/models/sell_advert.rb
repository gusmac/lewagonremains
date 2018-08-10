class SellAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_one :storage_space
  validates :condition, inclusion: { in: ["new", "like-new", "used"]}
  validates :title, :description, :address, :condition, presence: true
  monetize :price_cents, allow_nil: true
  # validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
