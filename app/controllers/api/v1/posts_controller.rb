class Api::V1::PostsController < ApplicationController
  before_action :find_user
  def index
    @posts = @user.posts.includes(:comments, :likes)
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    render json: @posts

  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
