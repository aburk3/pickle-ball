class TournamentCommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destory]

	def create
		@comment = TournamentComment.new(comment_params)
		@comment.user = current_user
		@tournament = Tournament.find(params[:tournament_id])
		@tournament.tournament_comments << @comment
		@user = User.where(:id => @tournament.director)
		if @comment.save
			if @comment.user != @user
				UserMailer.with(tournament: @tournament, comment: @comment).tournament_comment.deliver_later
			end
      redirect_to tournament_path(@tournament)
    else
      render tournament_path(@tournament)
    end
  end

	def destroy
		@tournament = Tournament.find(params[:tournament_id])
		@comment = @tournament.tournament_comments.find(params[:tournament_comment_id])
		@comment.destroy
		redirect_to tournament_path(@tournament)
	end

	private

  def comment_params
    params.require(:tournament_comment).permit(:content)
  end

	def set_comment
		@comment = TournamentComment.find(params[:id])
	end
end
