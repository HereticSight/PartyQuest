Rails.application.routes.draw do
  # root 'StaticPagesController#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'users/signup', to: 'users#new'
  post 'users/signup', to: 'users#create'
  resources :users, except: [:new, :create]
end
