class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destory]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.director = current_user.id
    if @tournament.save
      @tournament.users << current_user
      @tournament.save
      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new
    end
  end

  def make_director
    @tournament = Tournament.find(params[:tournament_id])
    @user = User.find(params[:user_id])
    @tournament.director = @user.id
    @tournament.save
    redirect_to tournament_path(@tournament)
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to user_path(@tournament.director)
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(
        :name,
        :state,
        :city,
        :description,
        :events,
        :director
      )
    end

end
