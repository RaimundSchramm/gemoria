Gemoria::Application.routes.draw do

  resources :projects do
    resources :userstories
  end
  resources :tasks

  resources :current_userstories, only: [:index]

  match '/home' => 'home#index'
  root :to => 'current_userstories#index'
end
