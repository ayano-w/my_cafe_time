class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cafe

  def create
    favorite = @cafe.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    favorite = @cafe.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

  private
  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end
end
