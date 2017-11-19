class RecipeIdeasController < ApplicationController
  layout 'home.html.erb'
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
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'RecipeIdea was succesfully created.' }
        format.json { rendor :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.erros, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_idea_params)
        format.html { redirect_to @recipe, notice: 'RecipeIdea was succesfully updated.' }
        format.json { rendor :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.erros, status: :unprocessable_entity }
      end
    end
  end

  def destory
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipe_ideas_url, notice: 'RecipeIdea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_recipe_idea
    @recipe = RecipeIdea.find(params[:id])
  end

  def recipe_idea_params
    params.require(:recipe_idea).permit(:title, :user_id, :content)
  end
end
