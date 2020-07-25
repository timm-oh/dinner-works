require 'test_helper'

class RolePolicyTest < ActiveSupport::TestCase
  class AdminUsertest < RolePolicyTest
    setup do
      @user = users(:admin)
      @role = roles(:store_one)
    end

    def test_scope
      assert_equal Role.all, RolePolicy::Scope.new(@user, Role).resolve
    end

    def test_show
      assert RolePolicy.new(@user, @role).show?
    end

    def test_create
      assert RolePolicy.new(@user, @role).create?
    end

    def test_update
      refute RolePolicy.new(@user, @role).update?
    end

    def test_destroy
      assert RolePolicy.new(@user, @role).destroy?
    end
  end

  class StoreAdmintest < RolePolicyTest
    setup do
      @user = users(:store_admin)
      @roles = @user.roles
      @role = @roles.first
      refute_nil @role
    end

    def test_scope
      assert_equal @roles, RolePolicy::Scope.new(@user, Role).resolve
    end

    def test_show
      assert RolePolicy.new(@user, @role).show?
    end

    def test_create
      assert RolePolicy.new(@user, @role).create?
    end

    def test_update
      refute RolePolicy.new(@user, @role).update?
    end

    def test_destroy
      assert RolePolicy.new(@user, @role).destroy?
    end
  end
end
