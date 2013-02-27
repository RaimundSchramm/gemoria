Gemoria::Application.routes.draw do

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

  match '/home' => 'home#index'
  root :to => 'current_userstories#index'
end
