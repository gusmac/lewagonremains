class SearchController < ApplicationController
  def index
    if params[:query].present?
      query = params[:query]
      @results = SellAdvert.search(query) + BuyAdvert.searh(query) + StorageSpace.seach(query)
    else
      @results = SellAdvert.all + BuyAdvert.all + StorageSpace.all
    end
  end
end
