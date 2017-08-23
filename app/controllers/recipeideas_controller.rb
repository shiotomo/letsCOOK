class RecipeideasController < ApplicationController
  layout 'home.html.erb'

  def new
  end

  def list
    @recipes = Recipeidea.all
  end

  def create
    @recipe = Recipeidea.new
    @recipe.title = params[:recipeidea][:title]
    @recipe.idea = "レシピアイデア"
    @recipe.content = params[:recipeidea][:content]
    @recipe.save
    redirect_to '/recipeideas/list'
  end

  def idea
  end
end
