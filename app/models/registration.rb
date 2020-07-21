class Registration < ApplicationRecord

  validates :email, presence: true, format: { with: /[^\s]@[^\s]/ }

  belongs_to :parent, class_name: 'Registration', optional: true
  has_many :children, class_name: 'Registration', foreign_key: "parent_id"

end
