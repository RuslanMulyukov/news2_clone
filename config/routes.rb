News2Clone::Application.routes.draw do

  get "home/index"

  devise_for :users

  resources :users do
    resources :articles
    resources :categories
    resources :comments
    resources :votes
  end

  match "articles_by_max" => "home#articles_by_max"
  match "articles_by_min" => "home#articles_by_min"
  match "articles_by_date" => "home#articles_by_date"
  match "vote" => "home#vote"
  match "comment" => "articles#comment"
  
  root :to => "home#index"
end
