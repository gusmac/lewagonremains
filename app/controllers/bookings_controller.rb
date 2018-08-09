class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :show, :edit, :confirm, :cancel]

  def index
    @bookings = Booking.all.where("user = ?", current_user)
    #@bookings = policy_scope(Booking).order(name: :asc)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    # validates dates
    if @booking.start_date < @booking.end_date || @booking.start_date < Date.today
      raise # raise an error. Does not even get to saving.
      # TODO maybe we find a smart gem to do this.
    end

    @booking.user = current_user

    # calculating the price
    number_of_days = @booking.end_date - @booking.start_date
    @booking.price = number_of_days * @booking.storage_space.price_cents

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created"
    else
      render :new, alert: "Booking could not be created!"
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      # recalculating the price
      @booking.price = number_of_days * @booking.storage_space.price_cents
      redirect_to @booking, notice: "Booking successfully updated!"
    else
      render :edit
    end
  end

  def cancel
    @booking.status = "cancelled"
  end

  def confirm
    @booking.status = "confirmed"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :storage_space, :message)
  end
end
