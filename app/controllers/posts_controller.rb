class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])  # Find the user by user_id
    @posts = @user.posts   
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @post_index = @user.posts.find_index { |post| post.id == @post.id }
  end
end
