Gemoria::Application.routes.draw do

  resources :projects do
    resources :userstories, only: [:index]
  end
  resources :tasks

  root :to => "home#index"
end
