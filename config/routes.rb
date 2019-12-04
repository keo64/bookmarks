Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :bookmarks
  get '/friend/:id', to: "users/friends#show", as: 'user_friends_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bookmarks#index'
end
