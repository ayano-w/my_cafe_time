class CavesController < ApplicationController
  before_action :set_cafe, except:[:new, :create, :index]
  before_action :ensure_correct_user, only:[:edit, :update, :destroy]

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to caves_path
    else
      redirect_to new_cafe_path
    end
  end

  def index
    @cafes = Cafe.all
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
    if @cafe.update(cafe_params)
      redirect_to cafe_path(@cafe.id), notice: '更新しました'
    else
      redirect_to edit_cafe_path(@cafe.id)
    end
  end

  def destroy
    @cafe.destroy
    redirect_to caves_path, notice: '投稿を削除しました'
  end

  private

  def cafe_params
    params.require(:cafe).permit(:user_id, :category_id, :tea, :teacake, :tea_image, :comment)
  end

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end

  def ensure_correct_user
    cafe = Cafe.find(params[:id])
    unless cafe.user.id == current_user.id
      redirect_to root_path, notice: "他ユーザーの投稿を編集・削除することはできません"
    end
  end

end
