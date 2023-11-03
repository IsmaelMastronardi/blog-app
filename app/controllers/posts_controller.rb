class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id]) # Find the user by user_id
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @post_index = @user.posts.find_index { |post| post.id == @post.id }
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
