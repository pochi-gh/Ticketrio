class LivesController < ApplicationController
  def index
    @artist = Artist.find(artist_params[:id])
  end


  def new
    @artist = Artist.find(artist_params[:id])
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      @concert = ArtistConcert.new(artist_id: artist_only_params[:artist_id], live_id: @live.id)
      @concert.save
      redirect_to "/lives?id=#{artist_only_params[:artist_id]}"

    else
      render :new
    end
  end

  private
  def artist_params
    params.permit(:id)
  end

  def live_params
    params.require(:live).permit(:title,:data,:time,:prefecture_id,:hall)
  end

  def artist_only_params
    params.require(:live).permit(:artist_id)
  end

end
