class Registration < ApplicationRecord

  validates :email, presence: true, format: { with: Devise.email_regexp }

  belongs_to :parent, class_name: 'Registration', optional: true
  has_many :children, class_name: 'Registration', foreign_key: "parent_id"

end
