require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_path
    assert_response :success
  end

  test "POST create with valid email" do
    assert_difference 'Registration.count', +1 do
      post registrations_path, params: {
        registration: {
          email: 'test@sample.com'
        }
      }
    end
    assert_redirected_to root_path
  end

  test "POST create with invalid email" do
    assert_no_difference 'Registration.count' do
      post registrations_path, params: {
        registration: {
          email: 'testsample.com'
        }
      }
    end
    assert_response :success
    assert flash[:alert].present?
  end

end
