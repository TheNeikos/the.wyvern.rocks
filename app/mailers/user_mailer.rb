class UserMailer < ApplicationMailer
  # TODO: Use ENV variables instead of hard coding this
  default from: 'user@the.wyvern.rocks'

  def confirmation_mail(token)
    @user = token.user
    @url = user_verify_email_url(@user, token: token.token)
    mail= "#{@user.name} <#{@user.email}>"
    mail(to: @user.email, subject: 'Welcome to The Wyvern Rocks')
  end
end
