Rails.application.routes.draw do

  root to: 'registrations#new'

  devise_for :users

  resources :registrations, only: [:new, :create, :show]

  authenticate :user, ->(user) { user.admin? } do
    mount FieldTest::Engine, at: "field_test"
  end
end
