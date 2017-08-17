Rails.application.routes.draw do
  get 'recipes/list'
  get 'recipes/show'
  get 'recipes/new'

  post 'recipes' => 'recipes#create'

  # devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }

  get 'homes/index'
  get 'homes/about'

  root to: 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
