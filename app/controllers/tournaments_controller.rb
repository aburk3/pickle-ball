class TournamentsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destory]

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
    @tournament = Tournament.new(club_params)
    @tournament.club_admin = current_user.id
    if @tournament.save # need to get rid of this, since instance `@tournament.users << current_user`
      @tournament.users << current_user
      @tournament.save
      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new
    end
  end

  def make_admin
    @tournament = Tournament.find(params[:club_id])
    @user = User.find(params[:user_id])
    @tournament.club_admin = @user.id
    @tournament.save
    redirect_to tournament_path(@tournament)
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to user_path(@tournament.club_admin)
  end

  private
    def set_club
      @tournament = Tournament.find(params[:id])
    end

    def club_params
      params.require(:tournament).permit(
        :name,
        :description,
        :state,
        :city,
        :contact,
      )
    end

end
