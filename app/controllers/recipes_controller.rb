class RecipesController < ApplicationController
  layout 'home.html.erb'

  def list
    @recipes = Recipe.all
  end

  def show
  end

  def create
    @recipe = Recipe.new
    now = Time.current
    @recipe.title = params[:recipe][:title]
    @recipe.postdate = now
    @recipe.save
    redirect_to '/recipes/list'
  end

  def new
  end
end
