Gemoria::Application.routes.draw do

  root :to => 'home#index'

  get '/signup' => 'users#new',           :as =>   :signup
  resources :users,                       :only => [:new, :create]

  get '/login' => 'sessions#new',         :as =>   :login
  delete '/logout' => 'sessions#destroy', :as =>   :logout
  resources :sessions,                    :only => [:new, :create, :destroy]

  resources :categories

  resources :projects do
    resources :userstories
    resources :sprints, only: [:update] do
      put 'complete', on: :member
    end
  end

  resources :userstories, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :tasks
    resources :acceptance_tests, except: [:show]
  end

  resources :current_userstories, only: [:index]
end
