Rails.application.routes.draw do
  get 'storage_spaces/index'
  get 'storage_spaces/new'
  get 'storage_spaces/create'
  get 'storage_spaces/show'
  get 'storage_spaces/update'
  get 'storage_spaces/destroy'
  get 'storage_spaces/edit'
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
