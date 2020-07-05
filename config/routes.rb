Rails.application.routes.draw do
  root to: 'home#index'
  resources :registrations, only: :create
end
