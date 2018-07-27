Rails.application.routes.draw do
  # get 'rooms/show', to: 'rooms#show', as: 'room'

  devise_for :users
  root 'home#index'
  post 'rooms/:id', to: 'rooms#create', as: 'new_room'
  get 'rooms/:id', to: 'rooms#show', as: 'room_specific'  
  resources :rooms

  get 'rooms/distribute', to: 'rooms#distribute', as: 'room_distribute'

  mount ActionCable.server => '/cable'
  get '/users/sign_out', to: redirect('/')
  
end
