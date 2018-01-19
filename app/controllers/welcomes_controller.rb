# welcomes controller
class WelcomesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: 'desc')
    @favorites = Favorite.where(user_id: current_user.id)
    @chart_recipe_data = Recipe.where(user_id: current_user.id).group(:date).count

    # cateoryの分布データ構築
    # category.each do |num|
    #   puts num.category
    #   puts Recipe.statuses.key(num.category)
    # end

    status = Recipe.statuses_i18n
    @category = Hash.new(0)


    @recipes.each do |recipe|
      @category[status[recipe.category]] += 1
    end
  end
end
