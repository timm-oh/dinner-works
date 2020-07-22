Rails.application.routes.draw do

  root to: 'registrations#new'
  get 'home/index'

  devise_for :users

  resources :registrations, only: [:new, :create, :show]

  authenticate :user, ->(user) { user.admin? } do
    mount FieldTest::Engine, at: "field_test"
    mount Flipper::UI.app(FeatureFlags) => '/flipper'
  end
end
