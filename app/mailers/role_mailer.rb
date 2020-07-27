class RoleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.role_mailer.invitation.subject
  #
  def invitation
    @role = params[:role]

    mail to: @role.email
  end
end
