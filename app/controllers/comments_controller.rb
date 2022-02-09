class CommentsController < ApplicationController
  before_action :ensure_correct_user, only:[:destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to cafe_path(params[:cafe_id])
    else
      redirect_to cafe_path(params[:cafe_id]), notice: "100文字以内で投稿してください"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to cafe_path(params[:cafe_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :cafe_id, :user_id)
  end

  def ensure_correct_user
    cafe = Cafe.find(params[:cafe_id])
    comment = Comment.find(params[:id])
    unless comment.user == (current_user || cafe.user)
      redirect_to root_path, notice: "他ユーザーの投稿を削除することはできません"
    end
  end


end
