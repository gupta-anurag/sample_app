require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    mail = UserMailer.account_activation
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["rubyrails16@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reset_password_email" do
    mail = UserMailer.reset_password_email
    assert_equal "Reset password email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
