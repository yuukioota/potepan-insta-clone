Rails.application.routes.draw do
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                        registrations: 'registrations' }
  root to: "pages#home"
  get '/users/:id', to: 'users#show', as: 'user'
  
end
