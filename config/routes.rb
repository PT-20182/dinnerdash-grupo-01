Rails.application.routes.draw do
  get 'meals/index'
  get 'meals/show'
  get 'meals/new'
  get 'meals/edit'
  devise_for :users
  root to: 'main#index'
  resources :meals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
