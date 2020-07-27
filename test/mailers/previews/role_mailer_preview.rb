# Preview all emails at http://localhost:3000/rails/mailers/role_mailer
class RoleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/role_mailer/invitation
  def invitation
    RoleMailer.with(role: Role.first || Role.new(email: 'test@test.com', invited_by: User.first, store: Store.first)).invitation
  end

  def notify
    user = User.first
    RoleMailer.with(role: Role.new(email: 'test@test.com', invited_by: user, store: Store.first, user: user)).notify
  end

end
