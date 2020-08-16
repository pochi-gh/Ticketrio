class ArtistsController < ApplicationController

  def index
    @artists = Artist.where(['artist_name LIKE ?', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html 
      format.json 
    end
  end

  def new
    @artist = Artist.new
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
    params.require(:artist).permit(:artist_name)
  end

end
