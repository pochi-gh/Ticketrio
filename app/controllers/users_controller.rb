class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(params[:id])
  end

  def posts
    @tickets = Ticket.where(user_id: params[:id]).page(params[:page]).per(5)
  end

  def comment
    @comments = Comment.where(user_id: params[:id]).order("updated_at DESC").page(params[:page]).per(5)
  end

  def message
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? &&  params[:id] == current_user.id.to_s
  end

end
