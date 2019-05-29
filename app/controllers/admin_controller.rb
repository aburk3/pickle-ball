class AdminController < ApplicationController
  def show
    if current_user.email != "aburk3@gmail.com"
      redirect_to root_path
    else
      render :admin
    end
  end
end
