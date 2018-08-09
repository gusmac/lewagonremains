class SellAdvert < ApplicationRecord
  belongs_to :user
  has_one :category
  has_one :storage_space
end
