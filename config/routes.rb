Rails.application.routes.draw do
  root :to => 'api/v1/base#version'
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
