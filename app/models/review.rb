class Review < ApplicationRecord
  belongs_to :storage_space
  belongs_to :user
  validates :rating, :description, presence: true
end
