class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @sell_advert = SellAdvert.find(params[:sell_advert_id])
  end

  def show
    @sell_advert = SellAdvert.find(params[:sell_advert_id])
  end

  def create
    @sell_advert = SellAdvert.find(params[:sell_advert_id])
    @order = Order.new(user: current_user, sell_advert: @sell_advert)

    if @order.save
      redirect_to sell_advert_order_path(@sell_advert, @order), notice: "Order was successfully created"
    else
      redirect_to @sell_advert, alert: "Order unsuccessful!"
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
