Rails.application.routes.draw do

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }  
  root 'home#top'
  resources :users, :only => [:show, :index]
  resources :recipes
  resources :comments, :only => [:create, :destroy]
  resources :genres
  resources :materials
  resources :rooms, :only => [:create, :show, :index, :edit, :update]
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
  resources :likes, :only => [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
