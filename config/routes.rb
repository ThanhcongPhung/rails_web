Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  resources :channels
  resources :discussions do
    resources :replies
  end

  root 'discussions#index'
  
  devise_for :users,
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
end
