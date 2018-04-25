class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @email = params[:mail]
    @private_key = params[:private_key] || 'Day la private_key'
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to WCCoin')
  end
end
