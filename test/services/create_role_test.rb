require 'test_helper'

class CreateRoleTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  setup do
    @email = "#{SecureRandom.hex(3)}@hey.com"
    @store = stores(:one)
    @invited_by = users(:admin)
  end

  test 'should create a role for this store' do
    assert_no_difference 'User.count' do
      role = assert_difference 'Role.count', +1 do
        CreateRole.call(email: @email, store: @store, invited_by: @invited_by)
      end

      assert_emails 1
      # assert_enqueued_email_with RoleMailer, :invitation, args: role
      assert role.errors.none?
      assert role.is_a?(Role)
      assert_equal @store, role.store
      assert_equal @email, role.email
      assert_nil role.user
    end
  end

  test 'should create a role for this store with existing user' do
    user = users(:normal)
    @email = user.email
    assert_no_difference 'User.count' do
      role = assert_difference 'Role.count', +1 do
        CreateRole.call(email: @email, store: @store, invited_by: @invited_by)
      end

      assert_emails 1
      # assert_enqueued_email_with RoleMailer, :invitation, args: role
      assert role.errors.none?
      assert role.is_a?(Role)
      assert_equal @store, role.store
      assert_equal @email, role.email
      assert_equal user, role.user
    end
  end

  test 'should not create a role for this store if one already exists for this email' do
    role = roles(:store_one)

    assert_no_difference 'User.count' do
      existing_role = assert_no_difference 'Role.count' do
        CreateRole.call(email: role.email, store: role.store, invited_by: @invited_by)
      end
      assert_emails 0
      # assert_enqueued_email_with RoleMailer, :invitation, args: role
      assert existing_role.errors.any?
      assert existing_role.is_a?(Role)
    end
  end
end