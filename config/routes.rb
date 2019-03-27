Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :clubs do
    resources :meetings, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  end

  resources :tournaments do
    resources :follows
    resources :tournament_comments
  end

  resources :meetings, only: [:index, :show, :new, :create, :edit, :update]

  root "sessions#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  post "/join", to: "users#join"
  post "/leave", to: "users#leave"
  post "/follow_tournament", to: "users#follow_tournament"
  post "/unfollow_tournament", to: "users#unfollow_tournament"
  get '/auth/facebook/callback' => 'sessions#create'
  post "/admin", to: "clubs#make_admin", :as => 'admin'
  get "/search", to: "search#index", :as => 'search'
  get "/liked", to: "posts#liked"
  get "/followed", to: "tournaments#followed"
  get "/near", to: "tournaments#near"
  get "/localclubs", to: "clubs#near", :as => 'near_club'
end
