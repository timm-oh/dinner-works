class Store < ApplicationRecord
  validates :name, :location, presence: true
  has_many :products, inverse_of: :store

  has_many :roles
  has_many :admins, through: :roles, source: :user

  before_destroy -> { roles.find_each(&:destroy!) }
end
