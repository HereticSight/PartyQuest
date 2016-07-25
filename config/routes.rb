Rails.application.routes.draw do
  root 'static_pages#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/search', to: 'searches#query'

  resources :users, path_names: {new: 'signup', create: 'signup'}

  resources :campaigns, except: :index do
      resources :pictures, only: [:create, :new, :destroy]
      resources :locations, only: [:create, :new]
      resources :quests, only: [:new, :create, :destroy]
      resources :invites, only: [:new]
      patch '/invites', to: 'invites#update'
  end

  resources :locations, only: [:index, :show]

end
