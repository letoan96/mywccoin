class UsersController < ApplicationController
  def register
    @name = "toan"
    @email = "letranthetoan@gmail.com"
    UserMailer.with(user: @name, mail: @email).welcome_email.deliver_later
  end
end
