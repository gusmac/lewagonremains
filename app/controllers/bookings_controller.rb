class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :show, :edit, :confirm, :cancel]

  def index
    @bookings = Booking.all
    #@bookings = policy_scope(Booking).order(name: :asc)
  end

  def show
    @storage_space = StorageSpace.find(params[:storage_space_id])
    @review = Review.new
  end

  def new
    @booking = Booking.new
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.start_date = Date.parse("#{params[:startdate]}")
    @booking.end_date = DateTime.parse("#{params[:enddate]}")
    @booking.user = current_user
    @storage_space = StorageSpace.find(params[:storage_space_id])
    @booking.storage_space = @storage_space
    @booking.status = "Pending"


    # # validates dates
    if @booking.start_date > @booking.end_date || @booking.start_date < Date.today
      raise # raise an error. Does not even get to saving.
    end

    # calculating the price
    number_of_days = @booking.end_date - @booking.start_date
    @booking.price = number_of_days * @booking.storage_space.price

    if @booking.save
      redirect_to storage_space_booking_path(@storage_space, @booking)
    else
      redirect_to @storage_space
    end
  end

  def edit
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def update
    if @booking.update(booking_params)
      # recalculating the price
      number_of_days = @booking.end_date - @booking.start_date
      @booking.price_cents = number_of_days * @booking.storage_space.price_cents
      @booking.save
      redirect_to storage_space_booking_path(@booking.storage_space, @booking), notice: "Booking successfully updated!"
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
    params.require(:booking).permit(:start_date, :end_date, :storage_space, :status, :price_cents, :comment)
  end
end
