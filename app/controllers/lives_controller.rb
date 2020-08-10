class LivesController < ApplicationController
  def index
    @artist = Artist.find(artist_params[:id])
  end



  private
  def artist_params
    params.permit(:id)
  end
end
