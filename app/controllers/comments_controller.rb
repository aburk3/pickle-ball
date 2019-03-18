class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
	 	@comment = @post.comments.create(params[:comment].permit(:comment))
		redirect_to post_path(@post)
	end

	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
		binding.pry
    if @post.save
			binding.pry
      @post.save
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      redirect_to post_path(@post), notice: "Failed to create post."
    end
  end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
