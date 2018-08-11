class StorageSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, :description, :address, presence: true
  monetize :price_cents, allow_nil: true
  # validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  def search(params)
    sql_query = " \
      storage_space.title @@ :query \
      OR storage_space.description @@ :query \
    "
    @storage_spaces = StorageSpace.where(sql_query, query: "%#{params}%")
  end
end
