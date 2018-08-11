class BuyAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :subcategories, through: :category
  validates :title, :description, presence: true
  monetize :price_cents, allow_nil: true
  mount_uploader :photo, PhotoUploader
end
