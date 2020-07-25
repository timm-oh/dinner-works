class Product < ApplicationRecord
  belongs_to :store, inverse_of: :products

  validates :name, presence: true
  monetize :cost_cents
end
