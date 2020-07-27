module Admin
  class ApplicationController < ::ApplicationController
    before_action do
      raise ActionController::RoutingError.new('Not Found') unless FeatureFlags[:admin_portal].enabled?
    end

    layout 'admin'

    # before_action :set_store
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped

    # after_action :update_last_visited_store

    def home
      authorize :admin, :root?
      if current_user.admin?
        skip_policy_scope
        redirect_to admin_stores_path
      else
        @stores = policy_scope(Store)
        redirect_to admin_store_path(@stores.find_by(id: current_user.last_visited_store || @stores.first))
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