Rails.application.routes.draw do
  resources :welcomes
  resources :abouts
  resources :helps
  resources :settings

  get 'recipeideas/new'
  get 'recipeideas/list'
  get 'recipeideas/idea'
  post 'recipeideas' => 'recipeideas#create'

  get 'recipes/list'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/home'
  get 'recipes/recipe'
  get 'recipes/post'
  get 'recipes/edit'

  post 'recipes' => 'recipes#create'

  # devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }


  root to: 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
