class Product < ApplicationRecord
  # Relationships
  belongs_to :store, inverse_of: :products

  # Vaidations
  before_validation -> { self.position ||= 0 }
  validates :name, presence: true

  scope :ordered_by_position, -> { order(position: :asc) }

  monetize :cost_cents

end
