class FavoritesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.favorite.create(favorite_params)
    redirect_to welcomes_path
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = @recipe.favorite.find(params[:id])
    @favorite.destroy
    redirect_to welcomes_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:star, :user_id)
  end
end
