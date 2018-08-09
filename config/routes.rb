Rails.application.routes.draw do
  get 'buy_adverts/index'
  get 'buy_adverts/editcreate'
  get 'buy_adverts/update'
  get 'buy_adverts/show'
  get 'buy_adverts/new'
  get 'buy_adverts/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :storage_spaces do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  resources :reviews, only: [:destroy]

  resources :storage_spaces do
    resources :bookings, except: [:destroy]
  end

  resources :buy_adverts, path: 'wanted'
  resources :sell_adverts, path: 'for-sale'
end
