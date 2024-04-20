Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  get 'home/index'

  get '/cart', to: 'carts#index'
  get '/add_to_cart', to: 'carts#add'

  resources :settings, only: %i[edit index update]
end
