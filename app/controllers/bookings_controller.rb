class BookingsController < ApplicationController
  before_action :set_camel, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show

  end

  def new
    # @camel = Camel.find(params[:camel_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camel = @camel
    if @booking.save!
      redirect_to camels_path
    else
      render :new
    end
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
  @camel = Camel.find(params[:camel_id])
end

def booking_params
  params.require(:booking).permit(:date, :user_id, :camel_id)
end
end


