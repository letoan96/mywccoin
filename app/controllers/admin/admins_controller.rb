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
    @match = Match.find(params[:match_id].to_i)
    # @match.update_attributes(match_params)
    @description = params[:description] || "description"
    respond_to do |format|
      format.js { render :template => "admins/create_new_bet.js.erb", layout: false, content_type: 'text/javascript'  }
      puts "debug"
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
