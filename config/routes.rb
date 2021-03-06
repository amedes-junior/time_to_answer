Rails.application.routes.draw do
  namespace :admins_backoffice do
    #get 'admins/index'
    #get 'admins/edit/:id', to: 'admins#edit'
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end

  get 'backoffice', to: 'admins_backoffice/welcome#index'

  devise_for :users

  namespace :site do
    get 'welcome/index'
    get 'search',  to: 'search#questions'
    get 'subject/:subject_id/:subject',  to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end

  devise_for :admins, skip: [:registrations]

  #get 'welcome/index'
  get 'inicio', to: 'site/welcome#index'

  root 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
