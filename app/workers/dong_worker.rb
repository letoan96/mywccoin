require 'ethereum.rb'

class DongWorker
  include Sidekiq::Worker

  def perform(match_id, team_1, team_2, description)
    @match = Match.find(match_id)
    @match.description = description

    @match = Match.find(match_id)
    config = Rails.application.config_for(:blockchain)
    client = Ethereum::Client.create(config['rpc_url'])

    path = File.join(Rails.root, "build/contracts/Betting.json")
    contract_json = File.read(path)
    contract = JSON.parse(contract_json)

    @contract = Ethereum::Contract.create(
      name: 'Betting',
      code: contract['bytecode'],
      abi: contract['abi'],
      client: client
    )
    contract = Betting.new
    @address = contract.deploy_and_wait(team_1, team_2, description)
    if @address
      @match.contact_address = @address
      puts @address
      @match.save
    end
    # Object.update_attributes(:field1 => "value", :field2 => "value2", :field3 => "value3")
  end
end
