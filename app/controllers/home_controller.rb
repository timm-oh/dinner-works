class HomeController < ApplicationController
  before_action do
    raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:new_landing].enabled?
  end

  def index
  end
end
