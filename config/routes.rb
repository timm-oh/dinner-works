Rails.application.routes.draw do

  namespace :admin do
    resources :stores do
      resources :products
    end
  end

  root to: 'registrations#new'
  get 'home/index'

  devise_for :users

  resources :registrations, only: [:new, :create, :show]

  authenticate :user, ->(user) { user.admin? } do
    mount FieldTest::Engine, at: 'field_test'
    mount Flipper::UI.app(FeatureFlags) => '/flipper'
    mount Blazer::Engine, at: 'blazer'
  end
end
