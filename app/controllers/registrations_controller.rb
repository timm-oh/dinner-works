class RegistrationsController < ApplicationController
  layout false

  def create
    @registration = Registration.find_or_create_by(permitted_params)
    redirect_to root_path, notice: 'Thanks for signing up!'
  end

  private

  def permitted_params
    params.require(:registration).permit(:email)
  end
end
