DbcRspecRails::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  namespace :admin do
    resources :posts
  end

  resources :posts

  root :to => "home#index"
end
