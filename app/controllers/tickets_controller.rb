class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: artist_live_params[:live_id])
    @artist = Artist.find(artist_live_params[:artist_id])
    @lives = ArtistConcert.where(artist_id: artist_live_params[:artist_id]).includes(:live).order("lives.data ASC")
  end

  def new
    @artist = Artist.find(artist_live_params[:artist_id])
    @live = Live.find(artist_live_params[:live_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @artist = Artist.find(artist_params[:artist_id])
    if @ticket.save
      redirect_to "/tickets?artist_id=#{@artist.id}&live_id=#{@ticket.live.id}"
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @live = Live.find(@ticket.live.id)
    @commnet = Comment.new
    @comments = @ticket.comments.includes(:user)
  end

  def edit
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
  end


  private
    def artist_live_params
      params.permit(:artist_id,:live_id)
    end

    def ticket_params
      params.require(:ticket).permit(:seat, :piece, :text, :price, :live_id).merge(user_id: current_user.id)
    end

    def artist_params
      params.require(:ticket).permit(:artist_id)
    end



end
