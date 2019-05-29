class CamelsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @camels = policy_scope(Camel)
    @camels = Camel.where.not(latitude: nil, longitude: nil)

    @markers = @camels.map do |camel|
      {
        lat: camel.latitude,
        lng: camel.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { camel: camel }),
        image_url: helpers.asset_url('camel.png')
      }
    end
  end

  def show
    @camel = Camel.find(params[:id])
    @booking = Booking.new
    authorize @camel

    # @camels = Camel.where.not(latitude: nil, longitude: nil)
    @marker = [
      {
        lat: @camel.latitude,
        lng: @camel.longitude,
        image_url: helpers.asset_url('camel.png')
      }
    ]
  end

  def new
    @camel = Camel.new
    authorize @camel
  end

  def create
    @camel = Camel.new(camel_params)
    @camel.user = current_user
    if @camel.valid?
      @camel.save
      redirect_to camels_path
    else
      render :new
    end
    authorize @camel
  end

  def edit
  end

  def update
    @camel.update(camel_params)
    redirect_to camels_path
  end

  def destroy
    authorize @camel
    @camel.destroy
    redirect_to camels_path
  end

  private

  def set_camel
    @camel = Camel.find(params[:id])
  end

  def camel_params
    params.require(:camel).permit(:name, :description, :price, :category, :location, :photo)
  end
end
