Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'coders/:id', to: 'coders#show'
  
end
