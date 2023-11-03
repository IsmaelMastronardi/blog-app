class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @new_comment = Comment.new
    puts @post.title
    puts  @post.author
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user_id = current_user.id
    if @new_comment.save
      redirect_to user_post_path(@new_comment.post.author, @post)
    else
      render "new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end