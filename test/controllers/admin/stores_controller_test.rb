require 'controllers/admin/admin_test_helper'

module Admin
  class StoresControllerTest < BaseControllerTest
    setup do
      @store = stores(:one)
    end

    class AdminUser < StoresControllerTest
      setup do
        sign_in(users(:admin))
      end

      test "should get index" do
        get admin_stores_url
        assert_response :success
      end

      test "should get new" do
        get new_admin_store_url
        assert_response :success
      end

      test "should create store" do
        assert_difference('Store.count') do
          post admin_stores_url, params: { store: { location: @store.location, name: 'New Store Name' } }
        end

        assert_redirected_to admin_store_url(Store.last)
      end

      test "should show store" do
        get admin_store_url(@store)
        assert_response :success
      end

      test "should get edit" do
        get edit_admin_store_url(@store)
        assert_response :success
      end

      test "should update store" do
        patch admin_store_url(@store), params: { store: { location: @store.location, name: @store.name } }
        assert_redirected_to admin_store_url(@store)
      end

      test "should destroy store" do
        assert_difference('Store.count', -1) do
          delete admin_store_url(@store)
        end

        assert_redirected_to admin_stores_url
      end
    end
  end
end
