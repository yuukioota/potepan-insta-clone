Rails.application.routes.draw do
  
  devise_for :users, controllers: {
                                    omniauth_callbacks: 'users/omniauth_callbacks', 
                                    registrations: 'registrations' 
                                  }
  root to: "posts#index"
  get      '/users/:id', to: 'users#show', as: 'user'
  resources :posts, only: %i(index new create show destroy) do
    resources :photos,   only: %i(create)
    resources :likes,    only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
