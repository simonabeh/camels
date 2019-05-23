class CamelsController < ApplicationController
  def index
    @camels = Camel.all
  end

  def new
    @camel = Camel.new
  end

  def create
    @camel = Camel.new(camel_params)
    if @camel.save
      redirect_to camel_path(@camel)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def camel_params
    params.require(:camel).permit(:name, :description, :category, :location)
  end
end
