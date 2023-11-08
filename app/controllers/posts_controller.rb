class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id])
    @post_index = @post.author.posts.find_index { |post| post.id == @post.id }
  end

  def new
    @current_user = current_user
    @new_post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = current_user.posts.build(post_params)
    if @new_post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
