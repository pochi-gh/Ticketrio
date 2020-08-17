class ArtistsController < ApplicationController
  before_action :move_to_signup, only:[:new,:create]

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
  def move_to_signup
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
