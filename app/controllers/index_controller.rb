class IndexController < ApplicationController
  def index
    @matches = Match.upcoming_matches
    @matches.each do |match|
      match.time = match.time + 7.hours
    end
  end

  def how_to_bet
    byebug
  end
end


