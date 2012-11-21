Gemoria::Application.routes.draw do

  resources :projects do
    resources :userstories
  end

  resources :userstories, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :tasks
  end

  resources :current_userstories, only: [:index]

  match '/home' => 'home#index'
  root :to => 'current_userstories#index'
end
