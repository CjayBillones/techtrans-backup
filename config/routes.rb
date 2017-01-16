Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get '/' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/expertise'=> 'static_pages#expertise'
  get '/itso-ipophl' => 'static_pages#itso_ipophl'
  get '/resources' => 'static_pages#resources'

  get '/contact' => 'static_pages#contact', as: 'contact'
  post '/contact' => 'static_pages#send_message_email'

  resources :users
  get '/register' => 'users#new'
  post '/register' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :researchers

  resources :articles do
    collection do
      get 'tags/:tag', to: 'articles#index', as: :tag
    end
  end

  resources :ip_offers do
    collection do
      get '/tags/:tag', to: 'ip_offers#index', as: :tag
    end
  end

  resources :ip_needs do
    collection do
      get '/tags/:tag', to: 'ip_needs#index', as: :tag
    end
  end

  get '/tags' => 'tags#index'
  post '/subscribe' => 'subscriptions#subscribe'
  post '/unsubscribe' => 'subscriptions#unsubscribe'

  resources :industries do
    collection do
      get 'register' => 'industries#new'
    end
  end

  resources :academes do
    collection do
      get 'register' => 'academes#new'
    end
  end


end
