class TicketsController < ApplicationController

  def index
    @tickets = Ticket.where(live_id: params[:live_id]).order("created_at DESC").page(params[:page]).per(10)
    @live = Live.find(params[:live_id])
    @artist = Artist.find(params[:artist_id])
    @lives = ArtistConcert.where(artist_id: params[:artist_id]).includes(:live).where('data >= ?', Date.today).order("lives.data ASC")
  
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @live = Live.find(params[:live_id])
    @ticket = Ticket.new
    @lives = ArtistConcert.where(artist_id: params[:artist_id]).includes(:live).where('data >= ?', Date.today).order("lives.data ASC")
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @artist = Artist.find(artist_params[:artist_id])
    if @ticket.save
      flash[:notice] = '募集投稿が完了しました。'
      redirect_to "/tickets?artist_id=#{@artist.id}&live_id=#{@ticket.live.id}"
    else
      flash[:alert] = '投稿に失敗しました。入力情報に漏れがあります'
      redirect_to "/tickets?artist_id=#{@artist.id}&live_id=#{@ticket.live.id}"
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @live = Live.find(@ticket.live.id)
    @commnet = Comment.new
    @comments = @ticket.comments.includes(:user)
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    ticket= Ticket.find(params[:id])
    ticket.update(ticket_params)
    redirect_to ticket_path(params[:id])
  end


  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    flash[:notice] = 'チケット募集の投稿を削除しました。'
    redirect_to root_path
  end


  private
    def ticket_params
      params.require(:ticket).permit(:seat, :piece, :text, :price, :live_id).merge(user_id: current_user.id)
    end

    def artist_params
      params.require(:ticket).permit(:artist_id)
    end



end
