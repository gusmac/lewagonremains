Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  resources :storage_spaces do
    resources :reviews, except: [:destroy]
  end

  resources :reviews, only: [:destroy]

  resources :storage_spaces do
    resources :bookings, only: [:index, :create, :new, :edit, :update, :show]
  end

  resources :bookings, only: [:destroy]

  resources :buy_adverts
  resources :sell_adverts
  resources :booking
end
