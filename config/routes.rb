Rails.application.routes.draw do
  namespace :admins_backoffice do
    #get 'admins/index'
    #get 'admins/edit/:id', to: 'admins#edit'
    get 'welcome/index'
    resources :admins
    resources :subjects
  end
  devise_for :users

  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  devise_for :admins

  #get 'welcome/index'
  get 'inicio', to: 'site/welcome#index'

  root 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
