class Order < ApplicationRecord
  belongs_to :sell_advert
  belongs_to :user

  validates :user, :sell_advert, presence: true
end
