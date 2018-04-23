class Admin::AdminsController < ApplicationController
	before_action :require_login
	def index
		render 'admins/index'
	end

  def dashbroad

  end

  def match_setup

  end

	private
	def sign_in_url
		admin_login_path
	end
end
