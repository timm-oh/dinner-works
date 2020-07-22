require 'test_helper'

module Admin
  class BaseControllerTest < ActionDispatch::IntegrationTest
    setup do
      FeatureFlags[:admin_portal].enable
    end
  end
end