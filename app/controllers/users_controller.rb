class UsersController < ApplicationController
  def form
    @user = User.new
    render "users/register"
  end

  def create
    @user = User.new
    @email = params[:user][:nickname]
    @nickname = params[:user][:email]
    # UserMailer.with(user: @nickname, mail: @email).welcome_email.deliver_later
    respond_to do |format|
      format.js
    end
  end

end
