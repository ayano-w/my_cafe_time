class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to cafe_path(params[:cafe_id])
  end

  def destroy
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :cafe_id)
  end

end
