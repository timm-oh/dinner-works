class Registration < ApplicationRecord

  before_validation do
    self.referral_token ||= SecureRandom.hex(6)
  end

  validates :email, presence: true, format: { with: /[^\s]@[^\s]/ }
  validates :referral_token, presence: true

  belongs_to :parent, class_name: 'Registration', optional: true
  has_many :children, class_name: 'Registration', foreign_key: "parent_id"
end
