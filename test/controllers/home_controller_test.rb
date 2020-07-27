require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    FeatureFlags[:new_landing].enable
    get home_url
    assert_response :success
  end
end
