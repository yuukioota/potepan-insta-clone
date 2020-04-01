Rails.application.routes.draw do
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                        registrations: 'registrations' }
  root to: "posts#index"
  get '/users/:id', to: 'users#show', as: 'user'
  resources :posts, only: %i(index new create) do
    resources :photos, only: %i(create)
  end
end
