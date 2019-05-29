class StaticController < ApplicationController
  def show
    @users = User.all
    @clubs = Club.all
    @tournaments = Tournament.all
    @comments = Comment.all
    render :resources
  end
end
