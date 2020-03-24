class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destory]
  skip_before_action :require_logged_in, :only => [:show, :index]
  before_action :require_logged_in, only: [:create, :new, :near, :make_director, :destroy, :followed, :update]

  def index
    if params[:user_id] == nil || params.has_key?(:id)
      @tournaments = Tournament.all
    else
      @user = current_user
      @tournaments = @user.tournaments
    end

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
      current_user.save

      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)

      @tournament.save

      redirect_to tournament_path(@tournament), notice: "Update Successful."
    else
      redirect_to tournament_path(@tournament), notice: "Failed to Update."
    end
  end

  def near
    @tournaments = Tournament.where(city: current_user.city)
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
    current_user.score -= 10
    current_user.save
    redirect_to user_path(@tournament.director)
  end

  def followed
    @tournaments = []
    current_user.follows.each do |tournament|
      @tournaments << tournament.tournament
    end
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
        :url,
        :events,
        :director,
        :status
      )
    end

end
