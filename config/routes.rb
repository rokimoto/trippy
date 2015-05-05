Rails.application.routes.draw do

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "loggedin" => "sessions#loggedin"
  delete 'sessions' => "sessions#destroy"

  match 'auth/:provider/callback', to: 'sessions#create_facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('login'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy_facebook', as: 'signout', via: [:get, :post]


  get "users/new" => "users#new"
  post "users" => "users#create"

  root 'users#new'


   # This action should be created in the routes and controllers to create a splash page!
   # ------------------------------------------------------------------------------------
   resources :locations
   resources :users do
      resources :reviews
      end

   resources :locations


end
