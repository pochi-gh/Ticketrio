class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def posts
    @tickets = Ticket.where(user_id: params[:id])
  end

  def comment
  end

  def message
  end



end
