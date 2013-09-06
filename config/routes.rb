Gemoria::Application.routes.draw do

  root :to => 'current_userstories#index'
  match '/home' => 'home#index'

  match '/signup' => 'users#new'
  resources :users, only: [:new, :create]

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
