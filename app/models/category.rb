class Category < ApplicationRecord
  has_many :subcategories
  validates :name, presence: true
end
