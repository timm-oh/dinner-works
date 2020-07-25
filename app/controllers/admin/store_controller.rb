module Admin
  class StoreController < ApplicationController
    before_action :set_store

    private

    def set_store
      @store = policy_scope(Store).find(params[:store_id])
    end
  end
end
