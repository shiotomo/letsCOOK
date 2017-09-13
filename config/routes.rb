Rails.application.routes.draw do
  # get 'recipes/recipe'
  get 'recipes/menu'

  # get 'recipeideas/new'
  # get 'recipeideas/list'

  # post 'recipeideas' => 'recipeideas#create'
  # post 'recipes' => 'recipes#create'

  resources :notifications
  resources :recipes
  resources :recipeideas
  resources :welcomes
  resources :abouts
  resources :helps
  resources :settings


  # devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }


  root to: 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
