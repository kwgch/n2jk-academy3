Rails.application.routes.draw do

  resources :users do
    resources :posts do
      collection do
        patch 'read'
      end
      resources :comments do
        collection do
          patch 'readall'
        end
      end
    end
  end

  get '/auth/github/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  delete '/signout' => 'sessions#destroy', as: :signout
  root 'home#index'
end
