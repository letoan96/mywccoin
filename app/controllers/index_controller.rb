class IndexController < ApplicationController
  def index
  	@matches = Match.first
  end
end
