

class IndexController < ApplicationController
  def index
  	@matches = Match.all
  end
end
