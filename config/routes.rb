Rails.application.routes.draw do

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }  
  root 'home#top'
  resources :users, :only => [:show, :index]
  resources :comments, :only => [:create, :destroy]
  resources :genres
  resources :materials
  get 'rooms/related' => "rooms#related"
  resources :rooms, :only => [:create, :show, :index]
  resources :messages
  resources :users do
        member do
         get :following, :followers
        end
  end
  resources :relationships, :only => [:create, :destroy]
#   resources :likes, :only => [:create, :destroy]
  post "likes/:recipe_id/create" => "likes#create"
  post "likes/:recipe_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"
  resources :recipes do
        collection do 
          post :recipe_search
          get :genre_search
          get :vegetable
          get :meat
          get :fish
          get :rice
          get :pasta_gratin
          get :noodles
          get :soup
          get :salad
          get :powder
        end
  end
  resources :recipes do
    resources :comments
  end
  # post "/recipes/genre_search" => "recipes#genre_search"
  resources :recipes
  # get 'recipes/recipe_search' => 'recipes#recipe_search'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
