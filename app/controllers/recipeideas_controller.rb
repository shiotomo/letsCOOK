class RecipeideasController < ApplicationController
  layout 'home.html.erb'


  def index
  end

  def create
    @recipe = Recipeidea.new
    @recipe.title = params[:recipeidea][:title]
    @recipe.idea = "レシピアイデア"
    @recipe.content = params[:recipeidea][:content]
    @recipe.save
    redirect_to '/recipeideas/list'
  end

  def new
  end

  def edit
  end

  def show
    @recipes = Recipeidea.all
  end

  def update
  end

  def destroy
  end

  def idea
  end
end
