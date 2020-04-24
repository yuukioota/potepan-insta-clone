Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks', 
    registrations:      'registrations', 
  }
  
  devise_scope :user do
    get 'users/password_changes' => 'registrations#password_changes'
  end
  
  # root to: "posts#index"
  root to: "posts#following_posts"
  get      '/users/:id', to: 'users#show', as: 'user'
  
  resources :posts, only: %i(index new create show destroy following_posts) do
    collection do
      get "following_posts"
    end
    resources :photos,   only: %i(create)
    resources :likes,    only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: %i(create, destroy)
  resources :notifications, only: %i(index)
end
