class UpvotesController < ApplicationController
  before_action :find_comment
  before_action :find_post
  before_action :find_upvote, only: [:destroy]

  def create
    if already_upvoted?
      flash[:notice] = "You can't upvote more than once"
    else
      @comment.upvotes.create(user_id: current_user.id)
      current_user.score += 1
      current_user.save
    end
    redirect_to post_path(@post)
  end

  def index

  end

  def destroy
    if !(already_upvoted?)
      flash[:notice] = "Cannot unlike"
    else
      @upvote.destroy
      current_user.score -= 1
      current_user.save
    end
    redirect_to post_path(@post)
  end

  private
    def find_comment
      @comment = Comment.find(params[:comment_id])
    end

    def find_upvote
     @upvote = @comment.upvotes.find(params[:id])
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def already_upvoted?
      Upvote.where(user_id: current_user.id, comment_id:
      params[:comment_id]).exists?
    end
end
