Rails.application.routes.draw do

  # Authentication
  post '/register' => 'auth#register'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  # Users
  resources :users, except: [:new, :edit]

  # View/Search Profiles
  get '/profiles' => 'profiles#index'
  get '/profiles/:id' => 'profiles#show'

  # Current User Profiles
  get '/profile' => 'profiles#show_current'
  post '/profile' => 'profiles#create'
  patch '/profile' => 'profiles#update'
  delete '/profile' => 'profiles#destroy'


  # Gatherings
  resources :gatherings, except: [:new, :edit]

end
