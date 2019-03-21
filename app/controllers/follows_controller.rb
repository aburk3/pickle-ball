class FollowsController < ApplicationController
  before_action :find_tournament
  before_action :find_follow, only: [:destroy]

  def create
    if already_followed?
      flash[:notice] = "You can't like more than once"
    else
      @tournament.follows.create(user_id: current_user.id)
    end
    redirect_to tournament_path(@tournament)
  end

  def destroy
    if !(already_followed?)
      flash[:notice] = "Cannot unfollow"
    else
      @follow.destroy
    end
    redirect_to tournament_path(@tournament)
  end

  private

  def find_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def already_followed?
    Follow.where(user_id: current_user.id, tournament_id: params[:tournament_id]).exists?
  end

  def find_follow
   @follow = @tournament.follows.find(params[:id])
  end
end
