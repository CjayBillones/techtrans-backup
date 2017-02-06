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

  resources :users, except: [:new, :create]

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

  get '/admins' => 'admins#index'
  get '/admin' => 'admin_dashboards#analytics'
  get '/admin/manage_users' => 'admin_dashboards#manage_users'
  get '/admin/manage_ips' => 'admin_dashboards#manage_ips'
  get '/admin/manage_articles' => 'admin_dashboards#manage_articles'
  get '/admin/manage_resources' => 'admin_dashboards#manage_resources'

  post '/admin/approve_ip' => 'admins#approve_ip'
  post '/admin/reject_ip' => 'admins#reject_ip'
  post '/admin/approve_user' => 'admins#approve_user'
  post '/admin/reject_user' => 'admins#reject_user'
  post '/admin/reactivate_user' => 'admins#reactivate_user'
  post '/admin/resend_activation_link' => 'admins#resend_activation_link'
  post '/admin/grant_admin_access' => 'admins#grant_admin_access'
  post '/admin/revoke_admin_access' => 'admins#revoke_admin_access'
  post '/admin/feature_article' => 'admins#feature_article'
  post '/admin/unfeature_article' => 'admins#unfeature_article'
  post '/admin/subfeature_article' => 'admins#subfeature_article'
  post '/admin/unsubfeature_article' => 'admins#unsubfeature_article'

  get '/dashboard' => 'user_dashboards#index', as: 'user_dashboard'
  get '/dashboard/tags/:tags', to: 'user_dashboards#index', as: :dashboard_tag
  get '/manage_submissions' => 'user_dashboards#manage_submissions'
  get '/manage_subscriptions' => 'user_dashboards#manage_subscriptions'
  get '/view_ips' => 'user_dashboards#view_ips'
end
