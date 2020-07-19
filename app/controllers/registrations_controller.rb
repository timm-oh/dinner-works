class RegistrationsController < ApplicationController

  layout 'landing'

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.find_or_create_by(permitted_params)
    if @registration.save
      RegistrationMailer.with(registration: @registration).welcome.deliver_now
      redirect_to root_path, notice: 'Thanks for signing up!'
    else
      flash.now[:alert] = @registration.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def permitted_params
    params.require(:registration).permit(:email)
  end
end
