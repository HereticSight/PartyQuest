Rails.application.routes.draw do
  root 'static_pages#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, path_names: {new: 'signup', create: 'signup'}
end
