class RecipesController < ApplicationController
  layout 'home.html.erb'

  def index
  end

  def create
    @recipe = Recipe.new(recipe_params)
    now = Time.current
    @recipe.title = params[:recipe][:title]
    @recipe.postdate = now
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html {redirect_to @recipe, notice: 'Recipe was succesfully created.'}
        format.json {rendor :show, status: :created, location: @recipe}
      else
        format.html{render :new}
        format.json{render json: @recipe.erros, status: :unprocessable_entity}
      end
    end

    # now = Time.current
    # @recipe.title = params[:recipe][:title]
    # @recipe.postdate = now
    # @recipe.user_id = current_user.id
    # @recipe.save
    # redirect_to '/recipes/show'
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
    params.require(:recipe).permit(:name, :description, materials_attributes: [:id, :name, :amount, :ingredients_number, :_destroy], progresses_attributes: [:id, :content, :order_number, :_destroy])
  end
end
