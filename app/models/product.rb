class Product < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
  monetize :cost_cents
end
