class CommentsController < ApplicationController

  def create
      comment = Comment.create(comment_params)
      if comment.save
        flash[:notice] = 'コメントしました。'
        redirect_to "/tickets/#{comment_params[:ticket_id]}"
      else
        flash[:alert] = 'コメントを入力してください。'
        redirect_to "/tickets/#{comment_params[:ticket_id]}"
      end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_edit)
      flash[:notice] = 'コメントを修正しました。'
      redirect_to "/tickets/#{params[:ticket_id]}"
    else
      @ticket = Ticket.find(params[:ticket_id])
      @comment = Comment.find(params[:id])
      flash.now[:alert] = '更新できませんでした。コメントを入力してください。'
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = 'コメントを削除しました。'
      redirect_to ticket_path(params[:ticket_id])
    else
      flash[:alert] = 'コメントの削除に失敗しました。'
      redirect_to ticket_path(params[:ticket_id])
    end

  end


  private
    def comment_params
      params.require(:comment).permit(:text,:ticket_id).merge(user_id: current_user.id)
    end
 
    def comment_edit
      params.require(:comment).permit(:text)
    end

end
