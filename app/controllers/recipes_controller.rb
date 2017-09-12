class RecipesController < ApplicationController
  layout 'home.html.erb'

  def index
  end

  def create
    @recipe = Recipe.new
    now = Time.current
    @recipe.title = params[:recipe][:title]
    @recipe.postdate = now
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to '/recipes/show'
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def show
    @recipes = Recipe.where(user_id: current_user.id).reverse
  end

  def update
  end

  def destroy
  end

  def recipe
    @recipe = Recipe.find(params[:data])
  end

  private
  def set_recipe
    @recipe = Recipe.include(:materials).find(params[:id])
    @recipe1 = Recipe.include(:materials).find(params[:id])
    @recipe2 = Recipe.include(:progresses).find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, materials_attributes: [:id, :name, :amount, :ingredients_number, :_destroy])
    params.require(:recipe).permit(:name, :description, progresses_attributes: [:id, :content, :order_number, :_destroy])
  end
end
