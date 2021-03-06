class BuyAdvert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  validates :title, :description, presence: true
  monetize :price_cents, allow_nil: true
  mount_uploader :photo, PhotoUploader

  def self.search(params)
    sql_query = " \
      buy_adverts.title @@ :query \
      OR buy_adverts.description @@ :query \
    "
    BuyAdvert.where(sql_query, query: "%#{params}%")
  end
end
