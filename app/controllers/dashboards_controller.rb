class DashboardsController < ApplicationController
  def dashboard
    @user = current_user
    @cars = @user.cars
    @past_bookings = @user.bookings.select {|booking| booking.end_rent > Date.today}
  end
end
