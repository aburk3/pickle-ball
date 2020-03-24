class StaticController < ApplicationController
  skip_before_action :require_logged_in

  def show
    @users = User.all
    @clubs = Club.all
    @tournaments = Tournament.all
    @comments = Comment.all
    render :resources
  end
end
