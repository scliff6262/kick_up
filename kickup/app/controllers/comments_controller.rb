class CommentsController < ApplicationController

  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, event_id: params[:event_id])
    if @comment.save
      redirect_to event_path(@comment.event)
    else
      flash[:message] = "A comment must include some text!"
      redirect_to event_path(params[:event_id])
    end
  end
end
