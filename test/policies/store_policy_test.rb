require 'test_helper'

class StorePolicyTest < ActiveSupport::TestCase
  class AdminTest < StorePolicyTest
    setup do
      @user = users(:admin)
      @store = stores(:one)
    end

    def test_scope
      assert_equal Store.all, StorePolicy::Scope.new(@user, Store).resolve
    end

    def test_show
      assert StorePolicy.new(@user, @store).show?
    end

    def test_create
      assert StorePolicy.new(@user, @store).create?
    end

    def test_update
      assert StorePolicy.new(@user, @store).update?
    end

    def test_destroy
      assert StorePolicy.new(@user, @store).destroy?
    end
  end

  class StoreOwnerTest < StorePolicyTest
    setup do
      @user = users(:store_admin)
      @store = @user.stores.first
    end

    def test_scope
      assert_equal @user.stores.pluck(:id).sort, StorePolicy::Scope.new(@user, Store).resolve.pluck(:id).sort
    end

    def test_show
      assert StorePolicy.new(@user, @store).show?
    end

    def test_create
      refute StorePolicy.new(@user, @store).create?
    end

    def test_update
      assert StorePolicy.new(@user, @store).update?
    end

    def test_destroy
      refute StorePolicy.new(@user, @store).destroy?
    end
  end
end
