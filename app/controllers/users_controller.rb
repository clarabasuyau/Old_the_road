class UsersController < ApplicationController
before_action :authenticate_user!

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number, :photo)
  end
end
