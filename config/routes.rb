Rails.application.routes.draw do
  # get 'recipes/recipe'

  # get 'recipeideas/new'
  # get 'recipeideas/list'

  # post 'recipeideas' => 'recipeideas#create'
  # post 'recipes' => 'recipes#create'

  resources :recipes  do
    resources :favorites, only: [:create, :destroy]
  end
  resources :recipe_ideas
  resources :welcomes, only: :index
  resources :menus, only: :index
  resources :notifications, only: :index
  resources :abouts, only: :index
  resources :helps, only: :index
  resources :settings


  # devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }

  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
