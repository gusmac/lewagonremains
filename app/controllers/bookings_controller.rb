class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :show, :edit, :confirm, :cancel]

  def index
    @bookings = Booking.all
    #@bookings = policy_scope(Booking).order(name: :asc)
  end

  def show
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def new
    @booking = Booking.new
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @storage_space = StorageSpace.find(params[:storage_space_id])
    @booking.storage_space = @storage_space


    # # validates dates
    if @booking.start_date > @booking.end_date || @booking.start_date < Date.today
      raise # raise an error. Does not even get to saving.
      # TODO maybe we find a smart gem to do this.
    end

    # calculating the price
    number_of_days = @booking.end_date - @booking.start_date
    @booking.price_cents = number_of_days * @booking.storage_space.price_cents

    if @booking.save
      redirect_to storage_space_booking_path(@storage_space, @booking), notice: "Booking was successfully created"
    else
      redirect_to @storage_space, alert: "Booking unsuccessful! Have you tried turning it off and on again?"
    end
  end

  def edit
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def update
    if @booking.update(booking_params)
      # recalculating the price
      # number_of_days = @booking.end_date - @booking.start_date
      # @booking.price_cents = number_of_days * @booking.storage_space.price_cents
      redirect_to root_path, notice: "Booking successfully updated!"
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
