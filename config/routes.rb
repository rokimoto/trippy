Rails.application.routes.draw do

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "loggedin" => "sessions#loggedin"
  delete 'sessions' => "sessions#destroy"

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
