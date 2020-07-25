class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    home_index_path
  end

  def after_sign_up_path_for(resource)
    home_index_path
  end
end
