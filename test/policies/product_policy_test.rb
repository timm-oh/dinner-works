require 'test_helper'

class ProductPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:admin)
  end

  def test_scope
    assert_equal Product.all, ProductPolicy::Scope.new(@user, Product).resolve
  end

  class ScopedStoreTest < ProductPolicyTest
    setup do
      @store = stores(:one)
    end

    def test_show
      assert ProductPolicy.new(@user, @store).show?
    end

    def test_create
      assert ProductPolicy.new(@user, @store).create?
    end

    def test_update
      assert ProductPolicy.new(@user, @store).update?
    end

    def test_destroy
      assert ProductPolicy.new(@user, @store).destroy?
    end
  end
end
