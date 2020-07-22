Rails.application.routes.draw do

  root to: 'registrations#new'
  # devise_for :users
  resources :registrations, only: [:new, :create, :show]

  # mount FieldTest::Engine, at: "field_test"
end
