class SearchController < ApplicationController

  def users
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

  def clubs
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Club.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

  def tournaments
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Tournament.all.where("lower(first_name) LIKE :search", search: @parameter)
    end
  end

end
