class CamelsController < ApplicationController
  before_action :set_camel, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @camels = policy_scope(Camel)
  end

  def show
    # @camel = Camel.find(params[:id])
  end

  def new
    @camel = Camel.new
    authorize @camel
  end

  def create
    @camel = Camel.new(camel_params)
    @camel.user = current_user
    authorize @camel
    if @camel.save
      redirect_to camel_path(@camel)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @camel.update(camel_params)
    redirect_to camels_path
  end

  def destroy
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
