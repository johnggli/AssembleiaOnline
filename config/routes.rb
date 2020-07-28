Rails.application.routes.draw do
  resources :home
  resources :assemblies

  namespace :admin do
    resources :topics
    resources :users
    resources :pre_registrations 
    resources :assemblies do
      collection do
        put ':id/open_close_state', to: 'assemblies#open_close_state'
      end
    end
  end
  root 'home#index'
  devise_for :users

  get '/search_pre_registration', to: 'home#search', as: :search_pre_registration
  
  get 'assemblies/:topic_id/history_votes', to:'assemblies#history_votes', as: :history_votes

  patch 'admin/users/:id/set_paid', to:'admin/users#set_paid', as: :set_paid
  patch 'admin/users/:id/set_not_paid', to:'admin/users#set_not_paid', as: :set_not_paid

  get 'assemblies/:option_id/do_a_vote', to:'assemblies#do_a_vote', as: :do_a_vote

end
