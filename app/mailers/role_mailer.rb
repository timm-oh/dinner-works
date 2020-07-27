class RoleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.role_mailer.invitation.subject
  #

  before_action do
    @role = params[:role]
  end

  def invitation
    mail to: @role.email
  end

  def notify
    @user = @role.user
    @store = @role.store
    mail to: @user.email
  end
end
