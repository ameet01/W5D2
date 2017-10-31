class CommentsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      if @comment.parent_comment_id == nil
        redirect_to post_url(@comment.post_id)
      else
        redirect_to comment_url(@comment.parent_comment_id)
      end
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end


  private
  def comment_params
    params.require(:comment).permit(:post_id, :body, :parent_comment_id)
  end
end
