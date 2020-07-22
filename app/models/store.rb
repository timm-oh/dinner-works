class Store < ApplicationRecord
  validates :name, :location, presence: true
  has_many :products
end
