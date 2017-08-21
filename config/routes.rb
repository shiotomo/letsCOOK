Rails.application.routes.draw do
  get 'helps/index'

  get 'settings/profile'

  get 'settings/setting'

  get 'recipes/list'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/home'
  get 'recipes/recipe'

  post 'recipes' => 'recipes#create'

  # devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }

  get 'welcomes/index'
  get 'welcomes/about'

  root to: 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
