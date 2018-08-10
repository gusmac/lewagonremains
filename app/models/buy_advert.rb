class BuyAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  validates :title, :description, presence: true
  monetize :price_cents, allow_nil: true
  mount_uploader :photo, PhotoUploader
end
