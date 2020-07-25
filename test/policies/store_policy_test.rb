require 'test_helper'

class StorePolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:admin)
  end

  def test_scope
    assert_equal Store.all, StorePolicy::Scope.new(@user, Store).resolve
  end

  class ScopedStoreTest < StorePolicyTest
    setup do
      @store = stores(:one)
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
end
