class SearchController < ApplicationController

  def search
    raise params.inspect
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else

    end
  end

end
