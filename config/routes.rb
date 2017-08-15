Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/delete'

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
