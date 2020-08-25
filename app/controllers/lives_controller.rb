class LivesController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @lives = ArtistConcert.where(artist_id: @artist.id).includes(:live).where('data >= ?', Date.today).order("lives.data ASC")
   
  end


  def new
    @artist = Artist.find(params[:id])
    @live = Live.new
  end

  def search
    params[:data] = new_data
    params[:time] = new_time
    @lives = Live.where(data: params[:data],time: params[:time], prefecture_id: live_search_params[:prefecture_id])
    @artist = Artist.find(params[:artist_id])
    @live = Live.new
  end


  def create
    if params[:live].has_key?(:title)
      @live = Live.new(live_params)
      if @live.save
        @concert = ArtistConcert.new(artist_id: artist_params[:artist_id], live_id: @live.id)
        @concert.save
        redirect_to "/lives?id=#{artist_params[:artist_id]}"
      else
        render :new
      end
    else
      @concert = ArtistConcert.new(artist_id: search_params[:artist_id], live_id: search_params[:live_id])
      if @concert.save
        redirect_to "/lives?id=#{artist_params[:artist_id]}"
      else
        render :search
      end
    end
  end

  private
  def live_params
    params.require(:live).permit(:title,:data,:time,:prefecture_id,:hall)
  end

  def artist_params
    params.require(:live).permit(:artist_id)
  end

  def live_search_params
    params.permit(:data, :time, :prefecture_id, :artist_id)
  end

  def search_params
    params.require(:live).permit(:artist_id, :live_id)
  end

  def new_data
    Date.new params["data(1i)"].to_i, params["data(2i)"].to_i,params["data(3i)"].to_i
  end
  def new_time
    Time.new params["time(1i)"].to_i, params["time(2i)"].to_i,params["time(3i)"].to_i,params["time(4i)"].to_i,params["time(5i)"].to_i
  end

end
