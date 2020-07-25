require 'test_helper'

class ProductPolicyTest < ActiveSupport::TestCase

  class AdminUserTest < ProductPolicyTest
    setup do
      @user = users(:admin)
      @product = products(:coke)
    end

    def test_scope
      assert_equal Product.all, ProductPolicy::Scope.new(@user, Product).resolve
    end

    def test_show
      assert ProductPolicy.new(@user, @product).show?
    end

    def test_create
      assert ProductPolicy.new(@user, @product).create?
    end

    def test_update
      assert ProductPolicy.new(@user, @product).update?
    end

    def test_destroy
      assert ProductPolicy.new(@user, @product).destroy?
    end
  end

  class StoreAdminUserTest < ProductPolicyTest
    setup do
      @user = users(:store_admin)
      @products = Product.where(store: @user.stores)
      @product = @products.first
    end

    def test_scope
      assert_equal @products, ProductPolicy::Scope.new(@user, Product).resolve
    end

    def test_show
      assert ProductPolicy.new(@user, @product).show?
    end

    def test_create
      assert ProductPolicy.new(@user, @product).create?
    end

    def test_update
      assert ProductPolicy.new(@user, @product).update?
    end

    def test_destroy
      assert ProductPolicy.new(@user, @product).destroy?
    end
  end
end
