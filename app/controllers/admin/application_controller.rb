module Admin
  class ApplicationController < ::ApplicationController
    before_action do
      raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:admin_portal].enabled?
    end
  end
end