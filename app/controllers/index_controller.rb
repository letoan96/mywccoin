class IndexController < ApplicationController
  def index
    @flags = Flag.all
    @matches = Match.upcoming_matches
  end

  def how_to_bet
    
  end
end


