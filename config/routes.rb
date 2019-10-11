Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :transactions, only: [ :create, :new]
    resources :messages, only: [ :index, :new, :create ]
  end

  resources :transactions, only: [ :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :create, :new]
  end

  resources :deals, only: [:index, :show]
  resources :reviews, only: [ :edit, :update, :destroy]
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/chats", to: "pages#chats", as: :chats
  get "/results", to: "pages#search", as: :search

  get 'favourites/update'
  get 'deals/new'
  get 'deals/create'
end
