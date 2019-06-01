class UserMailer < ApplicationMailer
  default from: 'pickleballsocial@gmail.com'

  def welcome_email(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end
end
