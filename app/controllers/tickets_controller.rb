class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: 2)
    @artist = Artist.find(1)
  end




end
