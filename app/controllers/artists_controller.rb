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
end
