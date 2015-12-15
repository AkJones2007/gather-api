Rails.application.routes.draw do

  # Authentication
  post '/register' => 'auth#register'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  # Users
  resources :users, except: [:new, :edit]

  # Profiles
  resources :profiles, except: [:new, :edit]

  # Gatherings
  resources :gatherings, except: [:new, :edit]

end
