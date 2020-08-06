class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: artist_params[:live_id])
    @artist = Artist.find(artist_params[:artist_id])
  end

  private
    def artist_params
      params.permit(:artist_id,:live_id)
    end

end
