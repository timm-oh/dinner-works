class HomeController < ApplicationController
  before_action do
    raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:new_landing].enabled?
  end

  skip_before_action :authenticate_user!

  def index
  end
end
