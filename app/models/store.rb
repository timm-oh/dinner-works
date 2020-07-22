class Store < ApplicationRecord
  validates :name, :location, presence: true
end
