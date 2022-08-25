class DashboardsController < ApplicationController
  def dashboard
    @user = current_user
    @cars = @user.cars
    @car = Car.new
    @past_bookings = @user.bookings.select {|booking| booking.end_rent < Date.today}
    @current_bookings = @user.bookings.select {|booking| booking.start_rent == Date.today}
    @future_bookings = @user.bookings.select {|booking| booking.start_rent > Date.today}
  end
end
