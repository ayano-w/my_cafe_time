class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to cafe_path(params[:cafe_id])
    else
      redirect_to cafe_path(params[:cafe_id]), notice: "100文字以内で投稿してください"
    end
  end

  def destroy
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :cafe_id, :user_id)
  end

end
