require 'ethereum.rb'

class UsersController < ApplicationController
  def new
    @user = User.new
    render "users/register"
  end

  def create
    @email = params[:user][:email]
    @nickname = params[:user][:nickname]
    @pk = params[:user][:private_key]
    @amount = params[:user][:amount].to_i
    @wallet_address = params[:user][:wallet_address]

    # config = Rails.application.config_for(:blockchain)
    # client = Ethereum::Client.create(config['rpc_url'])
    # formatter = Ethereum::Formatter.new
    # @wallet_address = formatter.to_address(params[:user][:wallet_address])

    # from = formatter.to_address(config['address'])
    # to = formatter.to_address(user_params[:wallet_address])

    # value = client.int_to_hex(formatter.to_wei(2))
    # client.eth_send_transaction(from: from, to: to, value: value)
    # path = File.join(Rails.root, "build/contracts/WCC.json")
    # contract_json = File.read(path)
    # contract = JSON.parse(contract_json)

    # @contract = Ethereum::Contract.create(
    #   name: 'WCC',
    #   address: '0xea6b7373e88d075809000e45cb4a417ee1c5616a',
    #   abi: contract['abi'],
    #   client: client
    # )
    # tx = @contract.transact.transfer(@wallet_address,  @amount)


    # puts Time.now
    HardWorker.perform_async(@nickname, @email, @pk, @amount, @wallet_address)

    # loop do
    #   raise Timeout::Error if ((Time.now - start_time) > 5.minutes)
    #   break unless client.eth_get_transaction_by_hash(tx.id).try(:dig, 'result', 'blockNumber').nil?
    #   sleep 2.seconds
    # end
    # UserMailer.with(user: @nickname, mail: @email, private_key: @pk).welcome_email.deliver_later

    # puts Time.now
    # byebug
    # @user = User.new(:nickname => @nickname, :email => @email, :private_key => @pk, :wallet_address => @wallet_address, :password => "1", :amount => @amount)
    # if @user.save
    #   UserMailer.with(user: @nickname, mail: @email, private_key: @pk).welcome_email.deliver_later
    # respond_to do |format|
    #   format.js
    # end
    # else
    #   puts "fail"
    # end
  end

  def betting

  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :private_key, :wallet_address, :amount)
  end
end
