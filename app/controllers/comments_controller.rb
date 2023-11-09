class CommentsController < ApplicationController
  before_action :find_user

  def new
    @post = Post.find(params[:post_id])
    @new_comment = Comment.new
    puts @post.title
    puts @post.author
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user_id = current_user.id
    if @new_comment.save
      redirect_to user_post_path(@new_comment.post.author, @post)
    else
      render 'new'
    end
  end

  def destroy
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    puts params
    @comment = Comment.find(params[:id])
    puts 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'
    puts @comment
    if @comment.destroy
      redirect_to user_posts_path(@user)
    else
      redirect_to user_post_path(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :comment_id)
  end
end
