class UserMailer < ApplicationMailer
  default from: 'pickleballsocial@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://pickleballsocial.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome Pickleball Social')
  end
end
