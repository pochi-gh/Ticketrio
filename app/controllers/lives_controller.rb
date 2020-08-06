class LivesController < ApplicationController
  def index
    @artist = Artist.find(1)
  
  end

end
