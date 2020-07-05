class Registration < ApplicationRecord
  validates :email, presence: true
end
