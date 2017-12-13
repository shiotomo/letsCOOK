# welcomes controller
class WelcomesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: 'desc')
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
