class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = Car.find(params[:car_id])
    @booking.user = current_user
    if @booking.save
      flash.alert = "Your booking ok"
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to car_path(@booking)

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
    params.require(:booking).permit(:start_rent, :end_rent, :message, :user_id, :car_id)
  end
end
