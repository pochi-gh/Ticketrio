class LivesController < ApplicationController
  def index
    @artist = Artist.find(artist_params[:id])
  end


  def new
    # @artist = Artist.find(artist_params[:id])
    @live = Live.new

  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to "/artists"
    else
      render :new
    end
  end

  private
  def artist_params
    params.permit(:id)
  end

  def live_params

  end

end
