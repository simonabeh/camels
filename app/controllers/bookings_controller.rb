class BookingsController < ApplicationController
  before_action :set_camel, only: [:show, :new, :create, :edit, :update]
  skip_after_action :verify_authorized, except: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @bookings = current_user.bookings
    @camels = current_user.camels
  end

  def show
  end

  def new
    # @camel = Camel.find(params[:camel_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @camel = Camel.find(params[:camel_id])
    @booking.camel = @camel
    @booking.user = current_user
    if @booking.save
      redirect_to camels_path, notice: 'Booking Ok'
    else
      redirect_to camel_path(Camel.find_by_id(params[:camel_id].to_i))
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    # @camel = @booking.camel
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_camel
    @camel = Camel.find(params[:camel_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :camel_id)
  end
end
