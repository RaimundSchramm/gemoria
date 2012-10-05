Gemoria::Application.routes.draw do

  resources :userstories, only: [:index, :new]
  resources :tasks

  root :to => "home#index"
end
