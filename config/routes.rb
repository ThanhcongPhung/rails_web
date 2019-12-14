Rails.application.routes.draw do
  resources :channels
  resources :discussions do
    resources :replies
  end

  root 'discussions#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
