Rails.application.routes.draw do
  # get 'rooms/show', to: 'rooms#show', as: 'room'

  devise_for :users
  root 'home#index'

  post 'rooms', to: 'rooms#create', as: 'room_new'  
  
  get 'rooms/:id', to: 'rooms#show', as: 'room_specific'  


  mount ActionCable.server => '/cable'
  get '/users/sign_out', to: redirect('/')
  
end
