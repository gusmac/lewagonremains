class Review < ApplicationRecord
  belongs_to :storage_space
  validates :rating, :description, presence: true
end
