module Admin
  class ApplicationController < ::ApplicationController
    layout 'admin'

    before_action do
      raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:admin_portal].enabled?
    end

    # before_action :set_store
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped

    # after_action :update_last_visited_store

    def home
      if current_user.admin?
      else
      end
    end

    private

    def set_store
      @store ||= current_user.last_visited_store
    end

    # def update_last_visited_store
    #   current_user.update(last_visited_store: @store)
    # end
  end
end