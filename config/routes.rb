Rails.application.routes.draw do

  root to: 'registrations#new'
  resources :registrations, only: [:new, :create, :show]

  # mount FieldTest::Engine, at: "field_test"
end
