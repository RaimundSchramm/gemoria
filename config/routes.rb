Gemoria::Application.routes.draw do

  resources :projects do
    resources :userstories
  end
  resources :tasks

  root :to => "home#index"
end
