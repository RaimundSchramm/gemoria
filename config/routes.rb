Gemoria::Application.routes.draw do

  root to: 'home#index'

  get '/signup', to: 'users#new', as: :signup
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories

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

  resources :current_userstories, only: [:index]

  resource :dashboard, only: [:show]

  resources :ownerships, only: [:index] do
    get 'edit_multiple', on: :collection
    post 'create_or_delete_multiple', on: :collection
  end
end
