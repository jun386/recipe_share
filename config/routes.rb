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
  resources :recipes do
    resources :comments
  end
  resources :relationships, :only => [:create, :destroy]
#   resources :likes, :only => [:create, :destroy]
  post "likes/:recipe_id/create" => "likes#create"
  post "likes/:recipe_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"
  resources :recipes do
        collection{ post "recipe_search"}
  end
  # get 'recipes/recipe_search' => 'recipes#recipe_search'
  resources :recipes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
