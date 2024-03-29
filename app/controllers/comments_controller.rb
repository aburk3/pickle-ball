class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@post = Post.find(params[:post_id])
		@post.comments << @comment
		if @comment.save
			if @comment.user != @post.user && @post.user.email_notifications == true
				UserMailer.with(post: @post, comment: @comment).post_comment.deliver_later
			end
			redirect_to post_path(@post)
    else
      render post_path(@post)
    end
	end

	def liked
    @comments = []
    current_user.upvotes.each do |post|
      @comments << post.post
    end
  end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:comment_id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

  def comment_params
    params.require(:comment).permit(:content)
  end

	def set_comment
		@comment = Comment.find(params[:id])
	end
end
