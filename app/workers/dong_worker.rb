require 'ethereum.rb'

class DongWorker
  include Sidekiq::Worker

  def perform(match_id, team_1, team_2, description)
    match = Match.find(match_id)

    config = Rails.application.config_for(:blockchain)
    client = Ethereum::Client.create(config['rpc_url'])

    path = File.join(Rails.root, "build/contracts/Betting.json")
    contract_string = File.read(path)
    contract_js = JSON.parse(contract_string)

    contract = Ethereum::Contract.create(
      name: 'Betting',
      code: contract_js['bytecode'],
      abi: contract_js['abi'],
      client: client
    )
    contract = Betting.new
    address = contract.deploy_and_wait(team_1, team_2, description)
    if address
       puts "Updated" if match.update_attributes(:contact_address => address, :description => description)
    end
    # Object.update_attributes(:field1 => "value", :field2 => "value2", :field3 => "value3")
  end
end
