class Category < ApplicationRecord
  has_many :subcategories
  has_many :buy_adverts
  has_many :sell_adverts
  validates :name, presence: true
end
