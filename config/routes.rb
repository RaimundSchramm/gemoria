Gemoria::Application.routes.draw do

  resources :projects do
    resources :userstories, only: [:index, :new, :create, :show, :edit, :update]
  end
  resources :tasks

  root :to => "home#index"
end
