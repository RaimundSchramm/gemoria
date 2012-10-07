Gemoria::Application.routes.draw do

  resources :userstories, except: [:edit]
  resources :tasks

  root :to => "home#index"
end
