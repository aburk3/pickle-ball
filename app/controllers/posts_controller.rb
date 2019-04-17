class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destory]

  def index
    @posts = Post.all
    respond_to do |f|
      f.html
      f.json { render json: @posts }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post }
    end
  end

  def liked
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
