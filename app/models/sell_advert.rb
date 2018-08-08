class SellAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :storage_space
end
