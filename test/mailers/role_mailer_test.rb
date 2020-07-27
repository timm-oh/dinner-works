require 'test_helper'

class RoleMailerTest < ActionMailer::TestCase
  test "invitation" do
    role = roles(:store_one)
    mail = RoleMailer.with(role: role).invitation
    assert_equal "You're invited! 🎉", mail.subject
    assert_equal [role.email], mail.to
    assert_equal ["team@dinner.works"], mail.from
    assert_match "Hey #{role.email}", mail.body.encoded
  end

end
