# recipe controller
class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: 'desc')
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def show
    redirect_to root_url unless @recipe.user_id == current_user.id
    @favorite = Favorite.where(recipe_id: params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :user_id, :memo, :description, materials_attributes: [:id, :name, :amount, :ingredients_number, :_destroy], progresses_attributes: [:id, :content, :order_number, :_destroy])
  end
end
