class SellAdvertsController < ApplicationController
  before_action :set_sell_advert, only: [:show]

  def index
    @sell_adverts = SellAdvert.all
  end

  def show
  end

  def new
    @sell_advert.new
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
