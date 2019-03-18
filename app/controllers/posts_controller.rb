class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      redirect_to new_post_path, notice: "Failed to create post."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
