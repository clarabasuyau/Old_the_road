class DashboardsController < ApplicationController
  def dashboard
    @user = current_user
    @cars = @user.cars
    @car = Car.new
    @past_bookings = @user.bookings.select {|booking| booking.end_rent < Date.today && booking.request == false}
    @current_bookings = @user.bookings.select {|booking| booking.start_rent == Date.today && booking.request == false}
    @future_bookings = @user.bookings.select {|booking| booking.start_rent > Date.today  && booking.request == false}
    @current_requests = @user.bookings.select {|booking| booking.status == "pending" && booking.request == true}
  end
end
