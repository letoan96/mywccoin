require 'ethereum.rb'
class Admin::AdminsController < ApplicationController
	before_action :require_login
  layout 'admin_layout'


	def index
		@users = User.where(:admin => false)
    @matches = Match.all
		render 'admins/index'
	end

  def match_setup
    @upcoming_matches = Match.upcoming_matches
    render 'admins/match_setup'
  end

  def create_new_bet

    @match_id = params[:match_id].to_i
    @match = Match.find(@match_id)
    @team_1 = @match.team_1.name
    @team_2 = @match.team_2.name
    @description = params[:description] || "description"

    # @match = Match.find(params[:match_id].to_i)
    # config = Rails.application.config_for(:blockchain)
    # client = Ethereum::Client.create(config['rpc_url'])
    # path = File.join(Rails.root, "build/contracts/Betting.json")
    # contract_json = File.read(path)
    # contract = JSON.parse(contract_json)

    # @contract = Ethereum::Contract.create(
    #   name: 'Betting',
    #   code: contract['bytecode'],
    #   abi: contract['abi'],
    #   client: client
    # )
    # contract = Betting.new
    # @address = contract.deploy_and_wait(@team_1, @team_2, @description)

    DongWorker.perform_async(@match_id, @team_1, @team_2, @description)

    # @match.update_attributes(match_params)

    respond_to do |format|
      format.js { render :template => "admins/create_new_bet.js.erb", layout: false, content_type: 'text/javascript'  }
    end
  end

	private
	def sign_in_url
		admin_login_path
	end

  def match_params
    params.permit(:match, :match_id, :description)
  end
end
