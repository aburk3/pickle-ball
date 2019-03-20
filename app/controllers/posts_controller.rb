class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destory]

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
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      redirect_to new_post_path, notice: "Failed to create post."
    end
  end

  def likes
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Update Successful."
    else
      redirect_to post_path(@post), notice: "Failed to Update."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
