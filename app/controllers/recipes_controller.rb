# recipe controller
class RecipesController < ApplicationController
  layout 'home.html.erb'
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
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was succesfully created.' }
        format.json { rendor :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.erros, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was succesfully updated.' }
        format.json { rendor :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.erros, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :user_id, :memo, :description, materials_attributes: [:id, :name, :amount, :ingredients_number, :_destroy], progresses_attributes: [:id, :content, :order_number, :_destroy])
  end
end
