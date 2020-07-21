Rails.application.routes.draw do
  namespace :user do
    #get 'home/index'
    resources :home
  end
  namespace :user do
    #get 'assemblies/index'
    resources :assemblies
  end
  namespace :admin do
    #get 'assemblies/index'
    resources :assemblies
  end
  namespace :admin do
    #get 'topics/index'
    resources :topics
  end
  namespace :admin do
    #get 'users/index'
    resources :users
  end
  namespace :admin do
    #get 'pre_registration/index'
    resources :pre_registrations 
  end
  devise_for :users

  patch 'admin/users/:id/set_paid', to:'admin/users#set_paid', as: :set_paid
  patch 'admin/users/:id/set_not_paid', to:'admin/users#set_not_paid', as: :set_not_paid

  patch 'admin/assemblies/:id/set_state', to:'admin/assemblies#set_state', as: :set_state
  patch 'admin/assemblies/:id/set_not_state', to:'admin/assemblies#set_not_state', as: :set_not_state
end
