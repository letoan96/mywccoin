class IndexController < ApplicationController
  def index
    @matches = Match.upcoming_matches
    @flags = Flag.all
  end
end
