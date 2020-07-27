class Role < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :store

  belongs_to :invited_by, class_name: 'User'

  before_validation -> { self.email = self.email.strip }

  validates :store, :email, :invited_by, presence: true
  validates :email, format: { with: Devise.email_regexp }, uniqueness: { scope: :store }
  validate :validate_email

  before_create -> { self.user = User.find_by(email: email) }

  scope :unaccepted, -> { where(user: nil) }

  def accept!(user)
    return unless user.email == email
    update!(user: user)
  end

  private

  def validate_email
    errors.add(:email, "is the same as the inviter") if email == invited_by.email
  end
end
