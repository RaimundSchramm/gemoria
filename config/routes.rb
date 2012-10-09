Gemoria::Application.routes.draw do

  resources :projects

  resources :userstories, except: [:edit]
  resources :tasks

  root :to => "home#index"
end
