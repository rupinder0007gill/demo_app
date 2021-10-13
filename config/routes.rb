# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }
  resources :users, only: %i[index edit update]
  resources :orders
  resources :orders_imports, only: %i[new create]
  root to: 'users#index'
end
