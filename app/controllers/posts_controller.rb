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
    puts 'aaaaaaaaaaaaaaa creating'
    @new_post = current_user.posts.build(post_params)
    puts @new_post.title
    puts @new_post.text
    puts 'aaaaaaaaaaaaaaa created'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
