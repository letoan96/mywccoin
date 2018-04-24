class UsersController < ApplicationController
  def form
    @user = User.new
    render "users/register"
  end

  def create
    @user = User.new
    @email = params[:user][:email]
    @nickname = params[:user][:nickname]
    @saveUser = User.new(email: @email,nickname: @nickname, password: "123")
    @saveUser.save
    UserMailer.with(user: @nickname, mail: @email).welcome_email.deliver_later
    respond_to do |format|
      format.js
    end

  end

end
