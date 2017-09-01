class WelcomesController < ApplicationController
  layout 'home.html.erb'
  before_action :authenticate_user!, only: :index

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
