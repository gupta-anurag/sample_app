class UserMailer < ActionMailer::Base
  default from: "rubyrails16@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #

  def account_activation(user)
    @user = user

    mail to: user.email, subject: "Account activation"
  end

  def password_reset_email(user)
    @greeting = "Hi"

    mail to: user.email
  end
end
