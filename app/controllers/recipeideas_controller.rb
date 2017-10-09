# recipeidea controller
class RecipeideasController < ApplicationController
  layout 'home.html.erb'

  def index
    @recipe = Recipeidea.where(user_id: current_user.id).reverse
  end

  def create
    @recipe = Recipeidea.new
    @recipe.title = params[:recipeidea][:title]
    @recipe.user_id = current_user.id
    @recipe.content = params[:recipeidea][:content]
    @recipe.save
    redirect_to '/recipeideas'
  end

  def new
    @recipe = Recipeidea.new
  end

  def edit
    @recipe = Recipeidea.find(params[:id])
  end

  def show
    @recipe = Recipeidea.find(params[:id])
  end

  def update
    @recipe = Recipeidea.new

    @recipe.title = params[:recipeidea][:title]
    @recipe.user_id = current_user.id
    @recipe.content = params[:recipeidea][:content]
    @recipe.save

    Recipeidea.find(params[:id]).destroy

    redirect_to '/recipeideas'
  end

  def destroy
    Recipeidea.find(params[:id]).destroy
    redirect_to '/recipeideas'
  end

  def idea
    # @recipe = Recipeidea.find(params[:data])
  end
end
