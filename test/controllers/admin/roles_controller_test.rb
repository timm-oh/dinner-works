require 'controllers/admin/admin_test_helper'

module Admin
  class RolesControllerTest < BaseControllerTest
    setup do
      @role = roles(:store_one)
      @store = @role.store
    end

    class AdminUserTest < RolesControllerTest
      setup do
        sign_in(users(:admin))
      end

      test "should get index" do
        get admin_store_roles_url(@store)
        assert_response :success
      end

      test "should get new" do
        get new_admin_store_role_url(@store)
        assert_response :success
      end

      test "should create role" do
        assert_difference('Role.count') do
          post admin_store_roles_url(@store), params: { role: { email: 'some_random_email@example.com' } }
        end

        assert_redirected_to admin_store_role_url(@store, Role.last)
      end

      test "should show role" do
        get admin_store_role_url(@store, @role)
        assert_response :success
      end

      # test "should get edit" do
      #   get edit_admin_role_url(@role)
      #   assert_response :success
      # end

      # test "should update role" do
      #   patch admin_role_url(@role), params: { role: { user_id: @role.user_id } }
      #   assert_redirected_to role_url(@role)
      # end

      test "should destroy role" do
        assert_difference('Role.count', -1) do
          delete admin_store_role_url(@store, @role)
        end

        assert_redirected_to admin_store_roles_url(@store)
      end
    end
  end
end
