class IndexController < ApplicationController
  def index
    @flags = Flag.all
    @matches = Match.upcoming_matches
  end

  def how_to_bet

  end

  def about_us

  end

  def top_100

  end

end


