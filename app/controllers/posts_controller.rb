class PostsController < ApplicationController
  def index; end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end
end
