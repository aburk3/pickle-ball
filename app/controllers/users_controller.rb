class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @clubs = Club.all
  end

  def show
    @user_feed = []
    @clubs = Club.last(2)

    @users = User.all

    @tournaments = Tournament.all
    @posts = Post.all
    @clubs = Club.all

    @user_feed = @tournaments + @posts + @clubs
    @sorted_feed = @user_feed.sort_by {|obj| obj.created_at}.reverse!
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      UserMailer.welcome_email(@user).deliver_now

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.email != "test@gmail.com" && @user.update(user_params)
      redirect_to user_path(@user), notice: "Update Successful."
    else
      if @user.email == "test@gmail.com"
        redirect_to user_path(@user), notice: "I'm sorry, the test user's profile settings cannot be modified."
      else
        render :edit, notice: "Failed to Update."
      end
    end
  end

  def join
    @club = Club.find(params[:club_id])
    @club.users << current_user
    @club.user_clubs.last.favorite_club = true
    @club.reached_max
    if @club.save
      redirect_to club_path(@club), notice: "Congratulations! You've joined this club."
    else
      redirect_to @club, notice: "I'm sorry, you were not able to join this club."
    end
  end

  def leave
    @club = Club.find(params[:club_id])
    current_user.clubs.destroy(@club)
    redirect_to @club, notice: "You have successfully left this club!"
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :state,
        :city,
        :utpr_d,
        :utpr_m,
        :utpr_s,
        :member_num,
        :skill_d,
        :skill_s,
        :image,
        :remove_profile_image
      )
    end

    def set_user
      @user = User.find(params[:id])
    end

end
