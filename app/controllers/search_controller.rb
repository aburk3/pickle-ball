class SearchController < ApplicationController

  def search_users
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

  def search_clubs
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

  def search_clubs
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

end
