class SearchController < ApplicationController
  def index
    if params[:query].present?
      query = params[:query]
      @results = SellAdvert.search(query) + StorageSpace.search(query) + BuyAdvert.search(query)
    else
      @results = SellAdvert.all + BuyAdvert.all + StorageSpace.all
    end
    return @results
  end
end
