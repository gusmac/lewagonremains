class BuyAdvert < ApplicationRecord
  belongs_to :user

  monetize :price_cents, allow_nil: true
end
