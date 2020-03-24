class AdminController < ApplicationController
  def show
    if current_user.email != "aburk3@gmail.com"
      redirect_to user_path(current_user)
    else
      render :admin
    end
  end
end
