Rails.application.routes.draw do
  root 'static_pages#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, path_names: {new: 'signup', create: 'signup'}
  resources :parties

end
