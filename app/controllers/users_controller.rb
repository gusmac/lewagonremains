class UsersController < ApplicationController
    before_action :authenticate_user!
  def dashboard
    @user = current_user
    @storage_spaces = @user.storage_spaces
    @booking_for_my_storage = Booking.where(storage_space: @storage_spaces)
    @my_bookings = @user.bookings
    @buy_adverts = @user.buy_adverts
    @sell_adverts = @user.sell_adverts
  end
end
