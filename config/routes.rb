Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get '/about' => 'static_pages#about'
  get '/expertise'=> 'static_pages#expertise'
  get '/opportunities' => 'static_pages#opportunities'
  get '/itso-ipophl' => 'static_pages#itso_ipophl'
  get '/resources' => 'static_pages#resources'

  resources :users
  get '/register' => 'users#new'
  post '/register' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
end
