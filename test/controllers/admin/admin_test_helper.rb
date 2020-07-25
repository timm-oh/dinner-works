require 'test_helper'

module Admin
  class BaseControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      FeatureFlags[:admin_portal].enable
    end

    teardown do
      sign_out :user
    end
  end
end