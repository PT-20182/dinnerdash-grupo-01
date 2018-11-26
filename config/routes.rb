Rails.application.routes.draw do
  get 'meals/index'
  get 'meals/show'
  get 'meals/new'
  get 'meals/edit'
  resources :meals

  resources :categories
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  } # N sei o que isso aqui ta fazendo, o terminal so pediu pra por
  
  root to: 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
