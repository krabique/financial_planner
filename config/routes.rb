# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: %i[index create]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations'
  }

  root to: 'home#index'
end
