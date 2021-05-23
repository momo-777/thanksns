Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit] 
  resources :relationships, only: [:create, :destroy]

  resources :users do
    member do
     get :following, :followers
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chats do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resource :relationships, only: [:create, :destroy]
  end

  root 'chats#index'

  #以下210515introページ用に追記
  get 'introduction/index' => 'introduction#index'

  get "js_samples"=>"chats#js_sample"
end