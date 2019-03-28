class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destory]

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def show
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(club_params)
    @club.club_admin = current_user.id
    if @club.save # need to get rid of this, since instance `@club.users << current_user`
      @club.users << current_user
      @club.save
      current_user.score += 8
      current_user.save
      redirect_to @club, notice: "Club was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to club_path(@club), notice: "Update Successful."
    else
      redirect_to club_path(@club), notice: "Failed to Update."
    end
  end

  def make_admin
    @club = Club.find(params[:club_id])
    @user = User.find(params[:user_id])
    @club.club_admin = @user.id
    @club.save
    redirect_to club_path(@club)
  end

  def near
    @clubs = Club.where(city: current_user.city)
  end

  def my_clubs
    @clubs = []
    Club.all.each do |club|
      if club.users.include?(current_user)
        @clubs << club
      end
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    current_user.score -= 8
    current_user.save
    redirect_to user_path(@club.club_admin)
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(
        :name,
        :description,
        :state,
        :city,
        :contact,
      )
    end

end
