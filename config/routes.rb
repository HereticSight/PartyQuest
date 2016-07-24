Rails.application.routes.draw do
  root 'static_pages#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, path_names: {new: 'signup', create: 'signup'}
  
  resources :campaigns, except: :index do
      resources :locations, only: [:create, :new]
      resources :quests, only: [:new, :create, :destroy]
  end

  resources :locations, only: [:index, :show]

end
