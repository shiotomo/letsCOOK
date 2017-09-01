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
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def update
  end

  def destroy
  end

  # def home
  # end

  # def recipe 
  # end

  # def post
  # end

  # def list
  #   @recipes = Recipe.where(user_id: current_user.id)
  # end

  # def show
  # end

  # def edit
  #   @recipe = Recipe.all
  # end

  # def create
  #   @recipe = Recipe.new
  #   now = Time.current
  #   @recipe.title = params[:recipe][:title]
  #   @recipe.postdate = now
  #   @recipe.user_id = current_user.id
  #   @recipe.save
  #   redirect_to '/recipes/list'
  # end

  # def new
  # end
end
