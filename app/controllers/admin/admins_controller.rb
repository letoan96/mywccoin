class Admin::AdminsController < ApplicationController
	before_action :require_login
	def index
		render 'admins/index' 
	end

	private
	def sign_in_url
		admin_login_path
	end
end
