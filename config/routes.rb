Rails.application.routes.draw do
  get 'rooms/show', to: 'rooms#show', as: 'room'
  devise_for :users
  root 'home#index'
  get 'coders/:id', to: 'coders#show', as: 'coder'
  
  mount ActionCable.server => '/cable'
  
end
