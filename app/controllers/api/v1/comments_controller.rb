class Api::V1::CommentsController < ApplicationController
  include JsonWebToken
  skip_before_action :verify_authenticity_token, only: [:create]
  # before_action :find_user
  before_action :find_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def new
    @post = Post.find(params[:post_id])
    @new_comment = Comment.new
    puts @post.title
    puts @post.author
  end

  def create
    puts 'aaaaaaaaaaaaaaaaa'
    puts params
    @post = Post.find(params[:post_id])
    puts 'bbbbbbbbbbbbbb'
    puts @post
    # @new_comment = @post.comments.build(comment_params)
    @new_comment = Comment.create(post: @post, user: current_user, text: params[:text] )
    puts 'cccccccccccccccccccc'
    puts @new_comment
    @new_comment.user_id = current_user.id
    if @new_comment.save
      render json: @new_comment, status: :created
    else
      render json: { errors: @new_comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :comment_id)
  end
end