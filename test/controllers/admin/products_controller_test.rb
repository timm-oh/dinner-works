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

      test "should create product" do
        assert_difference('Product.count') do
          post admin_store_products_url(@store), params: {
            product: {
              name: @product.name, cost: @product.cost, description: @product.description
            }
          }
        end

        assert_redirected_to admin_store_product_url(@store, Product.last)
      end

      test "should show product" do
        get admin_store_product_url(@store, @product)
        assert_response :success
      end

      test "should get edit" do
        get edit_admin_store_product_url(@store, @product)
        assert_response :success
      end

      test "should update product" do
        patch admin_store_product_url(@store, @product), params: {
          product: {
            name: @product.name, cost: @product.cost, description: @product.description
          }
        }
        assert_redirected_to admin_store_product_url(@store, @product)
      end

      test "should destroy product" do
        assert_difference('Product.count', -1) do
          delete admin_store_product_url(@store, @product)
        end

        assert_redirected_to admin_store_products_url(@store)
      end

      test "should reorder products" do
        product_0 = products(:ordered_position_0)
        product_1 = products(:ordered_position_1)
        product_2 = products(:ordered_position_2)

        post reorder_admin_store_products_url(@store), params: {
          products: {
            ids: [product_1.id, product_2.id, product_0.id]
          }
        }

        product_0.reload
        product_1.reload
        product_2.reload

        assert_equal 0, product_1.position
        assert_equal 1, product_2.position
        assert_equal 2, product_0.position
      end
    end
  end
end
