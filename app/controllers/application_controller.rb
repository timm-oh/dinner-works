class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    Role.unaccepted.where(email: current_user.email).find_each do |role|
      role.accept!(current_user)
    end
    if current_user.admin? || current_user.roles.exists?
      admin_root_path
    else
      home_path
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    Role.unaccepted.where(email: resource.email).find_each do |role|
      role.accept!(resource)
    end
    super(resource)
  end

  def after_sign_up_path_for(resource)
    home_path
  end
end
