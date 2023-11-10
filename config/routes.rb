Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index]
          resources :likes, only: []
        end
      end
    end
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]

      # member do
      #   get 'comments_json', to: 'comments#index', defaults: { format: 'json' }
      # end
    end
  end
  root "users#index"
end
