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
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
  end

end
