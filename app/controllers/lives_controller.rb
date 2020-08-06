class LivesController < ApplicationController
  def index
    @artist = Artist.find(2)
  
  end

end
