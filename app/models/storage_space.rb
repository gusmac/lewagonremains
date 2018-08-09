class StorageSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews

  # validates :title, :description, :address, presence: true
end
