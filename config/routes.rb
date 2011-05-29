News2Clone::Application.routes.draw do

  get "home/index"

  devise_for :users

  resources :users do
    resources :articles
    resources :categories
    resources :comments
    resources :votes
  end

  match "vote" => "home#vote"
  
  root :to => "home#index"
end
