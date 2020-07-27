class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    accept_invitations(resource)
    if policy(:admin).root?
      admin_root_path
    else
      home_path
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    accept_invitations(resource)
    super
  end

  def after_sign_up_path_for(resource)
    home_path
  end

  private

  def accept_invitations(user)
    Role.unaccepted.where(email: user.email).find_each do |role|
      role.accept!(user)
    end
  end
end
