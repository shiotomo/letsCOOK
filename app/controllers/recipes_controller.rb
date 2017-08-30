class RecipesController < ApplicationController
  layout 'home.html.erb'

  def home
  end

  def recipe 
  end

  def post
  end

  def list
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
  end

  def edit
    @recipe = Recipe.all
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
end
