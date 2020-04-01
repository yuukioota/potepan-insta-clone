Rails.application.routes.draw do
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                        registrations: 'registrations' }
  root to: "pages#home"
  get '/users/:id', to: 'users#show', as: 'user'
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
end
