class BuyAdvertsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy, :show, :edit]

  def index
    if params[:query].present?
      sql_query = " \
        buy_adverts.title @@ :query \
        OR buy_adverts.description @@ :query \
      "
      @buy_adverts = BuyAdvert.where(sql_query, query: "%#{params[:query]}%")
    else
      @buy_adverts = BuyAdvert.all
    end
  end

  def edit
  end

  def create
    @buy_advert = BuyAdvert.new(booking_params)
    @buy_advert.user = current_user

    if @buy_advert.save
      redirect_to buy_advert_path, notice: "Advert was successfully created!"
    else
      render :new, alert: "Advert unsuccessful!"
    end
  end

  def show
  end

  def new
    @buy_advert = BuyAdvert.new
  end

  def update
    if @buy_advert.update(buy_advert_params)
      redirect_to @buy_advert, notice: "Ad was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @buy_advert.destroy
    redirect_to dashboard_path
  end

  private

  def set_buy_advert
    @buy_advert = BuyAdvert.find(params[:id])
    # authorize @buy_advert
  end

  def buy_advert_params
    params.require(:buy_advert).permit(:title, :description, :price_cents, :photo)
  end
end
