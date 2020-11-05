Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "events#index" 
resources :users
resources :sessions
resources :events
get '/login', to: 'sessions#new' 
get '/sign_up', to: 'users#new' 
get '/logout', to: 'sessions#destroy'
post 'attend', to: 'events#attend_event'
end
