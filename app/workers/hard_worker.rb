require 'ethereum.rb'

class HardWorker
  include Sidekiq::Worker

  def perform(nickname, email, private_key, amount, wallet_address)
    # Do something
    config = Rails.application.config_for(:blockchain)
    client = Ethereum::Client.create(config['rpc_url'])
    formatter = Ethereum::Formatter.new
    @wallet_address = formatter.to_address(wallet_address)

    from = formatter.to_address(config['address'])
    to = formatter.to_address(@wallet_address)

    value = client.int_to_hex(formatter.to_wei(2))
    client.eth_send_transaction(from: from, to: to, value: value)
    path = File.join(Rails.root, "build/contracts/WCC.json")
    contract_json = File.read(path)
    contract = JSON.parse(contract_json)

    @contract = Ethereum::Contract.create(
      name: 'WCC',
      address: '0xea6b7373e88d075809000e45cb4a417ee1c5616a',
      abi: contract['abi'],
      client: client
    )
    tx = @contract.transact.transfer(@wallet_address,  amount)


    puts Time.now
    start_time = Time.now
    loop do
      raise Timeout::Error if ((Time.now - start_time) > 5.minutes)
      break unless client.eth_get_transaction_by_hash(tx.id).try(:dig, 'result', 'blockNumber').nil?
      sleep 2.seconds
    end
    UserMailer.with(user: nickname, mail: email, private_key: private_key).welcome_email.deliver_later
    puts Time.now

    # @user = User.new user_params
    # if @user.save
    #   UserMailer.with(user: @nickname, mail: @email, private_key: @pk).welcome_email.deliver_later
    #   respond_to do |format|
    #     format.js
    #   end
    # end
  end
end
