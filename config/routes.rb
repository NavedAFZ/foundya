Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'home/index'
  resources :applicants
  root to: 'applicants#index'

  # get 'articles/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/articles', to: 'articles#index'

  get 'articles/about'
  get 'search', to: 'applicants#search'

  get 'mine', to: 'applicants#mine'
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
end
