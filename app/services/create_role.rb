module CreateRole
  extend self

  def call(email:, store:, invited_by:)
    user = User.find_by(email: email)
    role = store.roles.new(email: email, invited_by: invited_by, user: user)
    if role.valid? && role.new_record?
      role.save
      send_notification(role, user)
    end
    role
  end

  private

  def send_notification(role, user)
    mailer = RoleMailer.with(role: role)
    mailer_job = user ? mailer.notify : mailer.invitation
    mailer_job.deliver_now
  end
end