class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new

  end

  def create
    @car = Car.new(car_params)
    @car.list = @list
    if @car.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def car_params
    params.require(:car).permit(:brand_name, :city, :seats, :user_id)

  end
end
