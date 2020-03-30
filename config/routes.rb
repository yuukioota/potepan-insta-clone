Rails.application.routes.draw do
  
  root to: "pages#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/users/:id', to: 'users#show', as: 'user'
  
end
