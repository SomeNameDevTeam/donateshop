# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create update show index]
  resource :session, only: %i[create destroy]
end
