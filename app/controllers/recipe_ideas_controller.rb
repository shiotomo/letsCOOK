class RecipeIdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe_idea, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = RecipeIdea.where(user_id: current_user.id).reverse
  end

  def new
    @recipe = RecipeIdea.new
  end

  def edit
  end

  def show
    redirect_to root_url unless @recipe.user_id == current_user.id
  end

  def create
    @recipe = RecipeIdea.new(recipe_idea_params)
    if @recipe.save
      redirect_to recipe_ideas_path
    else
      render "new"
    end
  end

  def update
    if @recipe.update(recipe_idea_params)
      redirect_to recipe_ideas_path
    else
      render "edit"
    end
  end

  def destory
    @recipe.destroy
    redirect_to recipe_ideas_path
  end

  private
  def set_recipe_idea
    @recipe = RecipeIdea.find(params[:id])
  end

  def recipe_idea_params
    params.require(:recipe_idea).permit(:title, :user_id, :content, :date)
  end
end
