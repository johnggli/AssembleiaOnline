Rails.application.routes.draw do
  namespace :user do
    get 'home/index'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
