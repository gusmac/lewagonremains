class Order < ApplicationRecord
  belongs_to :sell_advert
  belongs_to :user

  validates :status, inclusion: { in: ["Pending", "Cancelled", "Confirmed"] }
  validates :user, :sell_advert, presence: true
end
