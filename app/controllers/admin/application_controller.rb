module Admin
  class ApplicationController < ::ApplicationController
    layout 'admin'

    before_action do
      raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:admin_portal].enabled?
    end

    before_action :set_store

    private

    def set_store
      @store ||= current_user.last_visited_store
    end
  end
end