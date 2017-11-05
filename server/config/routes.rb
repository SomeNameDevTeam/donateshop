# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create update show index]
  resource :session, only: %i[create destroy]

  resources :categories, only: %i[update show index destroy] do
    resources :modifiers, only: %i[update index destroy]
  end
end
