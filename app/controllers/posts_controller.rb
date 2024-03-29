class PostsController < ApplicationController
  skip_before_action :require_logged_in, :only => [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destory]
  before_action :require_logged_in, only: [:create, :new]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def liked
    @posts = []
    current_user.likes.each do |post|
      @posts << post.post
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      @post.save
      current_user.score += 2
      current_user.save
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      redirect_to new_post_path, notice: "Failed to create post."
    end
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    current_user.score -= 2
    current_user.save
    redirect_to posts_path(@post)
  end

  def add_category
    @post = Post.find(params[:id])
    @post.categories << Category.find(params[:category_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
