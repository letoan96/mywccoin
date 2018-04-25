class Admin::AdminsController < ApplicationController
	before_action :require_login
  layout 'admin_layout'


	def index
		@users = User.where(:admin => false)
    @matches = Match.all
		render 'admins/index'
	end

  def match_setup
    render 'admins/match_setup'
  end

	private
	def sign_in_url
		admin_login_path
	end
end
