class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: 1)
  end
end
