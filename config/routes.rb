Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/storer', to: 'pages#storer'
  get '/forumtest', to: 'pages#forum'
  get '/browse_wanted', to: 'buy_adverts#browse_buy'
  get '/browse_for_sale', to: 'sell_adverts#browse_sell'
  get '/browse_storage_space', to: 'storage_spaces#browse_storage_space'
  mount Thredded::Engine => '/forum'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  post 'sell_adverts/:sell_advert_id/send_email', to: 'sell_adverts#send_contact_email', as: 'send_contact_email'

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
