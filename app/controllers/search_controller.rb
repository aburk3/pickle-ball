class SearchController < ApplicationController

  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      parameter = params[:search].downcase
      @clubs = Club.all.where("lower(name) LIKE :search", search: "%#{parameter}%")
      @users = User.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search", search: "%#{parameter}%")
      @tournaments = Tournament.all.where("lower(name) LIKE :search", search: "%#{parameter}%")
    end
  end

end
