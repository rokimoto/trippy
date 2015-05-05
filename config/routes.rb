Rails.application.routes.draw do

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "loggedin" => "sessions#loggedin"
  delete 'sessions' => "sessions#destroy"

  get "users/new" => "users#new"
  post "users" => "users#create"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#new'


   # This action should be created in the routes and controllers to create a splash page!
   # ------------------------------------------------------------------------------------
   root 'static_pages#splash'
   resources :locations
   resources :users do
      resources :reviews
      end

   resources :locations


end
