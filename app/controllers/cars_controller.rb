class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all
    @user = current_user
    if params[:query].present?
      sql_query = "brand_name ILIKE :query OR city ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "info_window", locals: {car: car})
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    @user = current_user
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
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
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end


  private

  def car_params
    params.require(:car).permit(:brand_name, :model, :city, :seats, :price, :overview, :user_id, :photo)
  end
end
