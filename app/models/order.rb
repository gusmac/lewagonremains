class Order < ApplicationRecord
  belongs_to :sell_advert
  belongs_to :user
end
