Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [ :index, :create]
  end
end
