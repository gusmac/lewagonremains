class BuyAdvertsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy, :show, :edit]

  def index
    @buy_adverts = BuyAdvert.all
  end

  def edit
  end

  def update
  end

  def create
    @buy_advert = BuyAdvert.new(booking_params)
    @buy_advert.user = current_user

    if @buy_advert.save
      redirect_to storage_space_booking_path(@buy_advert), notice: "Advert was successfully created!"
    else
      redirect_to @buy_advert_path, alert: "Advert unsuccessful!"
    end
  end

  def show
  end

  def new
    @buy_advert = BuyAdvert.new
  end

  def destroy
  end

  private

  def set_buy_advert
    @buy_advert = BuyAdvert.find(params[:id])
    # authorize @buy_advert
  end

  def buy_advert_params
    params.require(:buy_advert).permit(:title, :description, :price_cents)
  end
end
