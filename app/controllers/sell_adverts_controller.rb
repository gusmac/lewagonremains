class SellAdvertsController < ApplicationController
  before_action :set_sell_advert, only: [:show, :edit, :destroy, :update]

  def index
    @sell_adverts = SellAdvert.all
  end

  def show
  end

  def new
    @sell_advert = SellAdvert.new
  end

  def create
    @sell_advert = SellAdvert.new(sell_advert_params)
    @sell_advert.user = current_user


    if @sell_advert.save
      redirect_to sell_advert_path(@sell_advert), notice: "Advert was successfully created!"
    else
      render :new, alert: "Advert unsuccessful!"
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

  def destroy
    @sell_advert.destroy
    redirect_to root_path
  end

  private

  def set_sell_advert
    @sell_advert = SellAdvert.find(params[:id])
  end

  def sell_advert_params
    params.require(:sell_advert).permit(:title, :description, :condition, :price_cents, :photo, :address, :category_id, :subcategory_id, :storage_space)
  end
end
