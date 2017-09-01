class RecipeideasController < ApplicationController
  layout 'home.html.erb'

  def new
  end

  def list
    @recipes = Recipeidea.where(user_id: current_user.id)
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
