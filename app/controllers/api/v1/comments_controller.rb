class Api::V1::CommentsController < ApplicationController
  include JsonWebToken
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :find_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = Comment.create(post: @post, user: current_user, text: params[:text] )
    @new_comment.user_id = current_user.id
    if @new_comment.save
      render json: @new_comment, status: :created
    else
      render json: { errors: @new_comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :comment_id)
  end
end