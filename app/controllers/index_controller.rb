class IndexController < ApplicationController
  def index
    @flags = Flag.all
    @matches = Match.upcoming_matches
  end
end
