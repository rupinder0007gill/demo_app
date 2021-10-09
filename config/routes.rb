# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords'
             }
  resources :users, only: %i[index edit update]
  root to: 'users#index'
end
