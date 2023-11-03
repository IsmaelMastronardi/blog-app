class LikesController < ApplicationController
  def create
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaa un like'
    @post = Post.find(params[:post_id])
    @new_like = Like.new(user_id: current_user, post_id: @post)
    puts @new_like
  end

end
