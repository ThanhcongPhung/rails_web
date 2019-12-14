Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  resources :channels
  resources :discussions do
    resources :replies
  end

  # root 'discussions#index'
  root controller: :rooms, action: :index
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
end
