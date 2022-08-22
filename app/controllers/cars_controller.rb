class CarsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_index_path
  end

end
