require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    assert_difference 'Registration.count', +1 do
      post registrations_path, params: {
        registration: {
          email: 'test@sample.com'
        }
      }
    end
    assert_redirected_to root_path
  end

end
