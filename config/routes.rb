# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dogs#index'

  resources :dogs, only: %i[index] do
    collection do
      get :fetch_image
    end
  end
end
