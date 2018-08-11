class SellAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_one :storage_space
  validates :condition, inclusion: { in: ["New", "Like-New", "Used"]}
  validates :title, :description, :address, :condition, presence: true
  monetize :price_cents, allow_nil: true
  # validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  def self.search(params)
    sql_query = " \
      sell_adverts.title @@ :query \
      OR sell_adverts.description @@ :query \
    "
    SellAdvert.where(sql_query, query: "%#{params}%")
  end
end
