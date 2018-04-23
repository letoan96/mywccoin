class IndexController < ApplicationController
  def index
    @flags = Flag.all
    
    @matches = Match.upcoming_matches

    @matches.each do |match|
      match.time = match.time + 7.hours
    end
  end
end
