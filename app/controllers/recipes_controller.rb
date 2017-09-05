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
    redirect_to '/recipes/list'
  end

  def new
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

end
