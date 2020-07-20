Rails.application.routes.draw do
  root to: 'registrations#new'
  resources :registrations, only: [:new, :create]

  # mount FieldTest::Engine, at: "field_test"
end
