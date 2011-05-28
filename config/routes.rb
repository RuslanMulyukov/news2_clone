News2Clone::Application.routes.draw do

  get "home/index"

  devise_for :users

  resources :users do
    resources :news
    resources :categories
    resources :comments
    resources :votes
  end
  
  root :to => "home#index"
end
