require 'test_helper'

class RegistrationMailerTest < ActionMailer::TestCase
  test "welcome" do
    registration = registrations(:one)
    mail = RegistrationMailer.with(registration: registration).welcome
    assert_equal "Hi 👋", mail.subject
    assert_equal [registration.email], mail.to
    assert_equal ["team@dinner.works"], mail.from
    assert_includes mail.body.raw_source, "Hey sample@example.com"
    assert_includes mail.body.raw_source, "Thanks for signing up to dinner.works!"
    assert_includes mail.body.raw_source, "We're building a platform for online food deliveries for the restaurant industry."
    assert_includes mail.body.raw_source, "Our vision is that no person should go to sleep hungry, and together we can accomplish that."
    assert_includes mail.body.raw_source, "Through the use of our platform, a percentage of every transaction will go towards feeding someone today."
    assert_includes mail.body.raw_source, "Our platform is still under development, but you'll be notified once its launched."
  end
end
