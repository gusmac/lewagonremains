class SellAdvertsController < ApplicationController
  before_action :set_sell_advert, only: [:show]

  def index
    if params[:query].present?
      sql_query = " \
        sell_adverts.title @@ :query \
        OR sell_adverts.description @@ :query \
        OR storage_space.title @@ :query \
        OR storage_space.description @@ :query \
      "
      @sell_adverts = SellAdvert.joins(:storage_space).where(sql_query, query: "%#{params[:query]}%")
    else
      @sell_adverts = SellAdvert.all
    end
  end

  def show
  end

  def new
    @sell_advert = SellAdvert.new
  end

  def create
    @sell_advert = SellAdvert.new(sell_advert_params)

    if @sell_advert.save
      redirect_to @sell_advert
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sell_advert.update(sell_advert_params)
      redirect_to @sell_advert, notice: "Advert successfully updated"
    else
      render :edit
    end
  end

  private

  def set_sell_advert
    @sell_advert = SellAdvert.find(params[:id])
  end

  def sell_advert_params
    params.require(:sell_advert).permit(:title, :description, :price_cents, :photo, :address, :category, :subcategory, :storage_space)
  end
end
