require 'ethereum.rb'

class UsersController < ApplicationController
  def new
    @user = User.new
    render "users/register"
  end

  def create
    @email = user_params[:email]
    @nickname = params[:nickname]
    @pk = params[:private_key]

    config = Rails.application.config_for(:blockchain)
    client = Ethereum::HttpClient.new(config['rpc_url'])
    formatter = Ethereum::Formatter.new

    from = formatter.to_address(config['address'])
    to = formatter.to_address(user_params[:wallet_address])

    value = client.int_to_hex(formatter.to_wei(2))
    client.eth_send_transaction(from: from, to: to, value: value)

    byebug

    @user = User.create(email: @email,nickname: @nickname, password: @email)

    UserMailer.with(user: @nickname, mail: @email).welcome_email.deliver_later

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :private_key, :wallet_address)
  end
end
