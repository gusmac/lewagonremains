class StorageSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, :description, :address, presence: true
  monetize :price_cents, allow_nil: true
  # validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(params)
    sql_query = " \
      storage_spaces.title @@ :query \
      OR storage_spaces.description @@ :query \
    "
    StorageSpace.where(sql_query, query: "%#{params}%")
  end
end
