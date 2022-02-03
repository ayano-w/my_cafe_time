class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :ensure_correct_user, only:[:edit, :update, :destroy]

  def show
    @cafes = Cafe.where(user_id: params[:id]).order("id DESC")
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました'
    else
      redirect_to edit_user_path(@user.id)
    end
  end


  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザーを削除しました'
  end

  private
  def user_params
    params.require(:user).permit(:email, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    unless @user.id == current_user.id
      redirect_to root_path, notice: "他ユーザーを編集・削除することはできません"
    end
  end
end
