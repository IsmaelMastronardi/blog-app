class PostsController < ApplicationController
  before_action :find_user
  def index
    @posts = @user.posts.paginate(page: params[:page], per_page: 5).includes(:comments, :likes)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_index = @post.author.posts.find_index { |post| post.id == @post.id }
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = current_user.posts.build(post_params)
    if @new_post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    if @post.destroy
      redirect_to user_posts_path(@user)
    else
      redirect_to user_post_path(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
