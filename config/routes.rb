Rails.application.routes.draw do

  root to: 'home#index'

  get 'static_pages/style_guide', as: :style_guide

  get '/signup',             to: 'users#new',        as: :signup
  resources :users,          only: [:new, :create]

  get '/login',              to: 'sessions#new',     as: :login
  delete '/logout',          to: 'sessions#destroy', as: :logout
  resources :sessions,       only: [:new, :create, :destroy]

  resource  :administration, only: [:show]
  resources :categories
  resources :roles

  resources :ownerships, only: [:index] do
    get 'edit_multiple',              on: :collection
    post 'create_or_delete_multiple', on: :collection
  end

  resources :projects do
    resources :userstories
    resources :sprints, only: [:update] do
      patch 'complete', on: :member
    end
  end

  resources :userstories, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :tasks
    resources :acceptance_tests, except: [:show]
  end

  resource :dashboard, only: [:show]

  resources :current_userstories, only: [:index]

  resources :password_resets, only: [:new, :create, :edit, :update]

  get '/releases', to: 'releases#index'
end
