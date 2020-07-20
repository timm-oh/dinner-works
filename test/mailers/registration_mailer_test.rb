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
    assert_includes mail.body.raw_source, "We building a platform designed for online food orders and deliveries for the restaurant industry."
    assert_includes mail.body.raw_source, "Through this platform, and by working together, our vision of helping those in need can be achieved."
    assert_includes mail.body.raw_source, "A percentage of every transaction will go towards filling a hungry persons tummy."
    assert_includes mail.body.raw_source, "Our platform is still under development, but we will notify you once it has launched."
    assert_includes mail.body.raw_source, "Interested in our vision? Get your friends to sign up too, the more the merrier."
  end
end
