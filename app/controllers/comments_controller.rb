class CommentsController < ApplicationController
  def create
      Comment.create(comment_params)
      redirect_to "/tickets/#{comment_params[:ticket_id]}"
  end

  private
    def comment_params
      params.require(:comment).permit(:text,:ticket_id).merge(user_id: current_user.id)
    end
end
