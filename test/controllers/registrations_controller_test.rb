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

  test "POST create with valid email and parent id" do
    parent = registrations(:one)

    assert_difference 'Registration.count', +1 do
      post registrations_path, params: {
        registration: {
          email: 'test@sample.com',
          parent_id: parent.id
        }
      }
    end

    assert_redirected_to root_path
    registration = Registration.last

    assert_equal parent, registration.parent
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
  end

  test 'GET show with valid registration id' do
    registration = registrations(:one)

    get registration_path(registration)
    assert_redirected_to new_registration_path(parent_id: registration.id)

    registration.reload
    assert_equal 1, registration.referral_count
  end

  test 'GET show with invalid registration id' do
    get registration_path(SecureRandom.hex(7))
    assert_redirected_to new_registration_path
  end

end
