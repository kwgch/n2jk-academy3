Rails.application.routes.draw do

  resources :users do
    resources :posts
  end

  get '/auth/github/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  delete '/signout' => 'sessions#destroy', as: :signout
  root 'home#index'
end
