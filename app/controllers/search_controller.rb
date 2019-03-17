class SearchController < ApplicationController

  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(first_name) LIKE :search", search: @parameter)
      binding.pry
    end
  end

end
