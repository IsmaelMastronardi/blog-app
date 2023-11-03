class LikesController < ApplicationController
  def create
    @poster = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @new_like = Like.create(user: current_user, post: @post)
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaa'
    puts @new_like
    redirect_to user_path(@poster)
  end

end
