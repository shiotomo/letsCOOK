class WelcomesController < ApplicationController
  layout 'home.html.erb'
  before_action :authenticate_user!, only: :index

  def index
  end

  def about
  end
end
