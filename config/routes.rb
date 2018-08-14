Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/storer', to: 'pages#storer'
  mount Thredded::Engine => '/forum'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  resources :storage_spaces do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  resources :reviews, only: [:destroy]

  resources :storage_spaces do
    resources :bookings, except: [:destroy]
  end

  resources :sell_adverts, path: 'for-sale' do
    resources :orders, except: [:destroy]
  end

  resources :buy_adverts, path: 'wanted'
  resources :search, only: [:index]
end
