class UserMailer < ApplicationMailer
  default from: 'pickleballsocial@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://pickleballsocial.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome Pickleball Social')
  end

  def post_comment
    @post = params[:post]
    @comment = params[:comment]
    @user = @post.user
    post_id = @post.id.to_s
    @url = 'https://pickleballsocial.herokuapp.com/posts/' + post_id
    mail(to: @user.email, subject: 'Your post has a new comment!')
  end

  def tournament_comment
    @tournament = params[:tournament]
    @comment = params[:comment]
    @user = User.where(:id => @tournament.director)[0]
    tournament_id = @tournament.id.to_s
    @url = 'https://pickleballsocial.herokuapp.com/tournaments/' + tournament_id
    mail(to: @user.email, subject: 'Your tournament has a new comment!')
  end
end
