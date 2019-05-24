class BookingsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show

  end

  def new
    @booking = Booking.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @camel = @booking.camel
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_camel
    @camel = Camel.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :camel_id)
  end
end
