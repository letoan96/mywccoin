class MatchesController < ApplicationController
  before_action :require_login
  layout 'admin_layout'
  def index
    @upcoming_matches = Match.upcoming_matches
    render 'admins/match_setup'
  end

  def create

  end

  def update
    match_id = params[:match_id].to_i
    match = Match.find(match_id)
    team_1 = match.team_1.name
    team_2 = match.team_2.name
    description = params[:description] || "description"

    DongWorker.perform_async(match_id, team_1, team_2, description)
    # respond_to do |format|
    #   format.js { render :template => "admins/create_new_bet.js.erb", layout: false, content_type: 'text/javascript'  }
    # end
  end

  private
  def match_params
    params.permit(:match, :match_id, :description)
  end
end
