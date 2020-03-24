class FeedController < ApplicationController
	skip_before_action :require_logged_in

  def index
    @tournaments = Tournament.all
    @posts = Post.all
    @clubs = Club.all

    @viewer_feed = @tournaments + @posts + @clubs
		@sorted_feed = @viewer_feed.sort_by {|obj| obj.created_at}.reverse!
  end

end
