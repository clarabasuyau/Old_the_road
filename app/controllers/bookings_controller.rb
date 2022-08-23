class BookingsController < ApplicationController
<<<<<<< HEAD
  befocre_action :set_car, only: [:new, :create]
=======
  before_action :set_car, only: [:new, :create]
>>>>>>> 96db9b823e4a75be41f9d241b82650099b2f81d5

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
<<<<<<< HEAD
    params.require(:booking).permit(:start_rent, :ent_rent, :user_id, :car_id)
=======
    params.require(:booking).permit(:start_rent, :end_rent, :user_id, :car_id)
>>>>>>> 96db9b823e4a75be41f9d241b82650099b2f81d5
  end
end
