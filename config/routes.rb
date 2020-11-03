Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "users#new" 
resources :users
resources :sessions
get '/login', to: 'sessions#new' 
get '/sign_up', to: 'users#new' 
get '/logout', to: 'sessions#destroy'

end
