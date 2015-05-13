Rails.application.routes.draw do

  resources :reviews

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "loggedin" => "sessions#loggedin"
  delete 'sessions' => "sessions#destroy"

  match 'auth/:provider/callback', to: 'sessions#create_facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('login'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy_facebook', as: 'signout', via: [:get, :post]

  get 'about' => 'sessions#about'

  get "users/new" => "users#new"
  post "users" => "users#create"

  root 'users#new'

  get 'users/:id' => 'users#show'
   # This action should be created in the routes and controllers to create a splash page!
   # ------------------------------------------------------------------------------------
   resources :users do
      resources :reviews
      end

  resources :locations

  namespace :api do
    get 'locations_api/search_name' => 'locations_api#search_name'
    get 'locations_api/search_location' => 'locations_api#search_location'
    get 'locations_api/reviews/:id' => 'locations_api#reviews', as: :reviews
    get 'locations_api/yelp/:id' => 'locations_api#yelp', as: :yelp
    resources :locations_api

  end



end
