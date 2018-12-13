Rails.application.routes.draw do

  # Cart on main page actions
  put '/add_item_to_cart', to: 'cart#add_item_to_cart', as: 'add_item_to_cart'
  delete '/remove_item_from_cart_main/:id', to: 'cart#remove_item_from_cart_main', as: 'remove_item_from_cart_main'
  delete '/remove_item_from_cart_checkout/:id', to: 'cart#remove_item_from_cart_checkout', as: 'remove_item_from_cart_checkout'

  # Checkout page actions
  get '/cart', to: 'cart#index', as: 'cart'
  # resources :cart

  get 'meals/index'
  get 'meals/show'
  get 'meals/new'
  get 'meals/edit'
  resources :meals
  resources :orders do
    resources :order_meals
  end

  resources :categories
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  } # N sei o que isso aqui ta fazendo, o terminal so pediu pra por
  
  root to: 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
