class DashboardsController < ApplicationController
  before_action :require_login
  layout 'admin_layout'
  def index
    @users = User.where(:admin => false)
    @matches = Match.all
    render 'admins/index'
  end
end
