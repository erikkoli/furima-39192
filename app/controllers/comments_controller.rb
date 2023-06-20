class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @exhibit = Exhibit.find(params[:exhibit_id])
    if @comment.valid?
      @comment.save
      CommentChannel.broadcast_to @exhibit, { comment: @comment, user: @comment.user.nickname } 
    else
      redirect_to exhibit_path(params[:exhibit_id])
    end 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, exhibit_id: params[:exhibit_id])
  end
end
