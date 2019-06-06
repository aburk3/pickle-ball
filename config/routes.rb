Rails.application.routes.draw do
  resources :users do
    resources :tournaments
  end

  resources :posts do
    resources :comments do
      get "/delete", to: "comments#destroy"
      resources :upvotes

    end
    resources :likes
  end
  resources :clubs do
    resources :meetings, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  end

  resources :tournaments do
    resources :follows
    resources :tournament_comments do
      get "/delete", to: "tournament_comments#destroy"
    end
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
  get "/upvoted", to: "comments#upvoted"
  get "/followed", to: "tournaments#followed"
  get "/near", to: "tournaments#near"
  get "/localclubs", to: "clubs#near", :as => 'near_club'
  get "/myclubs", to: "clubs#my_clubs", :as => 'my_clubs'
  get "/resources" => "static#show", :as => 'my_resources'
  get "/admin" => "admin#show"
end
