class Registration < ApplicationRecord
  validates :email, presence: true, format: { with: /[^\s]@[^\s]/ }
end
