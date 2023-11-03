class LikesController < ApplicationController
  def create
    @poster = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @new_like = Like.create(user: current_user, post: @post)
    redirect_back(fallback_location: user_path(@poster))
  end
end
