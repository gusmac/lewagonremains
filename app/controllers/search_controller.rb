class SearchController < ApplicationController
  def index
    if params[:categories].present? && params[:categories] != "All"
      category = Category.find_by_name(params[:categories])
      @sell_adverts = SellAdvert.where(category: category)
      @buy_adverts = BuyAdvert.where(category: category)
    else
      @sell_adverts = SellAdvert.all
      @buy_adverts = BuyAdvert.all
    end
    if params[:query].present?
      query = params[:query]
      @results = @sell_adverts.search(query) + StorageSpace.search(query) + @buy_adverts.search(query)
    else
      @results = @sell_adverts + @buy_adverts + StorageSpace.all
    end
    return @results
  end
end

