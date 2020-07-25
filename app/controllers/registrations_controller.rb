class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing'

  def new
    @copy = field_test(:registration_copy)
    @registration = Registration.new(params.permit(:parent_id))
  end

  def create
    @registration = Registration.find_or_create_by(permitted_params.slice(:email)) do |new_reg|
      new_reg.assign_attributes(permitted_params.slice(:parent_id))
    end

    if @registration.save
      field_test_converted(:registration_copy)
      RegistrationMailer.with(registration: @registration).welcome.deliver_now
      redirect_to root_path, notice: 'Thanks for signing up!'
    else
      render :new
    end
  end

  def show
    registration = Registration.find_by(id: params[:id]) || Registration.new
    registration.increment!(:referral_count) if registration.persisted?
    redirect_to new_registration_path(parent_id: registration.id)
  end

  private

  def permitted_params
    params.require(:registration).permit(:email, :parent_id)
  end
end
