class RegistrationMailer < ApplicationMailer

  def welcome
    @registration = params[:registration]
    @email = @registration.email

    mail to: @email
  end
end
