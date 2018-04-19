class IndexController < ApplicationController
  def index
  	@matches = Match.upcoming_matches
  end
end
