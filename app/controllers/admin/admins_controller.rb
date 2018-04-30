class Admin::AdminsController < ApplicationController
	before_action :require_login
  layout 'admin_layout'

	private
	def sign_in_url
		admin_login_path
	end

end
