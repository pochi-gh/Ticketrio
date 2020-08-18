class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: artist_params[:live_id])
    @artist = Artist.find(artist_params[:artist_id])
  end

  def new
    @artist = Artist.find(artist_params[:artist_id])
    @live = Live.find(artist_params[:live_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to "/artists"
    else
      render :new
    end
  end
  private
    def artist_params
      params.permit(:artist_id,:live_id)
    end

    def ticket_params
      params.require(:ticket).permit(:seat, :piece, :text, :price, :live_id).merge(user_id: current_user.id)
    end
end
