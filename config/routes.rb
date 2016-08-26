Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/expertise'
  get 'static_pages/opportunities'
  get 'static_pages/itso_ipophl'
  get 'static_pages/resources'
end
