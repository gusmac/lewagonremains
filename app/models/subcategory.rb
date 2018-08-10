class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :sell_adverts
  has_many :buy_adverts
  validates :name, presence: true
end
