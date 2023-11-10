Rails.application.routes.draw do
  root "users#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :new, :create]
          resources :likes, only: []
        end
      end
    end
  end

  post "/api/v1/auth/login", to: "authentication#login"
  post '/api/v1/user_post_comments', to: 'api/v1/comments#create'
  get 'api/v1/user_posts', to: "api/v1/posts#index"
  get 'api/v1/post_comments', to: "api/v1/comments#index"
  
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
end
