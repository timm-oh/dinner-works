require 'controllers/admin/admin_test_helper'

module Admin
  class ProductsControllerTest < BaseControllerTest
    setup do
      @product = products(:burger)
      @store = @product.store
    end

    class AdminUser < ProductsControllerTest
      setup do
        sign_in(users(:admin))
      end

      test "should get index" do
        get admin_store_products_url(@store)
        assert_response :success
      end

      test "should get new" do
        get new_admin_store_product_url(@store)
        assert_response :success
      end

      test "should create admin_product" do
        assert_difference('Product.count') do
          post admin_store_products_url(@store), params: {
            product: {
              name: @product.name, cost: @product.cost, description: @product.description
            }
          }
        end

        assert_redirected_to admin_store_product_url(@store, Product.last)
      end

      test "should show admin_product" do
        get admin_store_product_url(@store, @product)
        assert_response :success
      end

      test "should get edit" do
        get edit_admin_store_product_url(@store, @product)
        assert_response :success
      end

      test "should update admin_product" do
        patch admin_store_product_url(@store, @product), params: {
          product: {
            name: @product.name, cost: @product.cost, description: @product.description
          }
        }
        assert_redirected_to admin_store_product_url(@store, @product)
      end

      test "should destroy admin_product" do
        assert_difference('Product.count', -1) do
          delete admin_store_product_url(@store, @product)
        end

        assert_redirected_to admin_store_products_url(@store)
      end
    end
  end
end
