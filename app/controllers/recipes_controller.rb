# recipe controller
class RecipesController < ApplicationController
  layout 'home.html.erb'
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.where(user_id: current_user.id).reverse
  end

  def menu; end

  def new
    @recipe = Recipe.new
  end

  def edit
    p params[:id]
    @recipe = Recipe.find(params[:id])
  end

  def show
    # @recipe = Recipe.find(params[:id])

    redirect_to root_url unless @recipe.user_id == current_user.id
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # @recipe.title = params[:recipe][:title]
    # @recipe.user_id = current_user.id
    # @recipe.memo = params[:recipe][:memo]

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
    # @recipe = Recipe.new(recipe_params)
    # @recipe.title = params[:recipe][:title]
    # @recipe.user_id = current_user.id
    # @recipe.memo = params[:recipe][:memo]

    respond_to do |format|
      if @recipe.update(recipe_params)
        puts "---------------- debug1 ------------------"
        format.html { redirect_to @recipe, notice: 'Recipe was succesfully updated.' }
        format.json { rendor :show, status: :ok, location: @recipe }
      else
        puts "---------------- debug2 ------------------"
        format.html { render :edit }
        format.json { render json: @recipe.erros, status: :unprocessable_entity }
      end
    end
        puts "---------------- debug3 ------------------"
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to '/recipeideas'
  end


  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :user_id, :memo, :description, materials_attributes: [:id, :name, :amount, :ingredients_number, :_destroy], progresses_attributes: [:id, :content, :order_number, :_destroy])
  end
end
