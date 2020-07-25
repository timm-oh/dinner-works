class Store < ApplicationRecord
  validates :name, :location, presence: true
  has_many :products, inverse_of: :store
end
