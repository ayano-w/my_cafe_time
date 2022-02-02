class CavesController < ApplicationController
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
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def cafe_params
    params.require(:cafe).permit(:user_id, :category_id, :tea, :teacake, :tea_image, :comment)
  end
end
