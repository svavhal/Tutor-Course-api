# frozen_string_literal: true

# config/routes.rb

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses, only: %i[create index]
    end
  end
end
