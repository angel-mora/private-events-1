Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "events#index" 
resources :users, only: [:new, :create, :show, :edit, :index]
resources :sessions, only: [:new, :create, :destroy]
resources :events, only: [:index, :new, :create, :show]
get '/login', to: 'sessions#new' 
get '/sign_up', to: 'users#new' 
get '/logout', to: 'sessions#destroy'
post 'attend', to: 'events#attend_event'
end
